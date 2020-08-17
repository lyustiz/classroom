import AppFormat  from './AppFormat';
import AppRules   from './AppRules';
export default 
{
    mixins: [AppFormat, AppRules],
    
    computed: 
    {
        fullUrl() 
        {
            return this.apiUrl + this.path;
        },

        fullUrlId() 
        {
            return this.fullUrl + '/' + this.item.id
        },
    },

    data() 
    {
        return {
            apiUrl:  this.$App.apiUrl,
            idUser:  this.$store.getters.getUserid,
            loading: false,
            items:   [],
            search:  null,
            item:    null,
            path:    null,
            modal:   false,
            dialog:  false,
            confirm: false,
            valid:   true,
            validateForm: true,
        }
    },

    methods:
    {
        list()
        {
            this.loading = true

            axios.get(this.fullUrl)
            .then(response => 
            {
                this.items = response.data
            })
            .catch(error => 
            {
                this.showError(error)
            })
            .finally( () => 
            {
                this.loading = false
            });
        },

        getResource(resource)
        {
            this.loading = true
      
            return new Promise((resolve, reject) => 
			{
				axios.get(this.apiUrl + resource)
				.then(response => 
				{
                    resolve(response.data)
				})
				.catch(error => 
				{
                    this.showError(error)
                    reject(error)
                })
                .finally( () => 
                {
                    this.loading = false
                });
			})

        },

        postResource(resource, data)
        {
            this.loading = true;

            return new Promise((resolve, reject) => 
			{
				axios.post(this.apiUrl + resource, data)
				.then(response => 
				{
					resolve(response.data)
				})
				.catch(error => 
				{
                    this.showError(error)
                    reject(error)
                })
                .finally( () => 
                {
                    this.loading = false
                });
			})

        },

        deleteResource(resourceID, data)
        {
            if(!this.preFormActions('delete')) {
                return new Promise((resolve, reject) => 
                {
                    this.showError('favor validar los datos')
                    this.loading = false
                })  
            }

            return new Promise((resolve, reject) => 
			{
				axios.delete(this.apiUrl + resourceID, {data})
				.then(response => 
				{
					resolve(response.data)
				})
				.catch(error => 
				{
                    this.showError(error)
                    reject(error)
                })
                .finally( () => 
                {
                    this.loading = false
                });
			})

        },

        storeResource(resource, data)
        {
            
            if(!this.preFormActions('store')) {
                return new Promise((resolve, reject) => 
                {
                    this.showError('favor validar los datos')
                    this.loading = false
                })  
            }

            return new Promise((resolve, reject) => 
			{
				axios.post(this.apiUrl + resource, data)
				.then(response => 
				{
					resolve(response.data)
				})
				.catch(error => 
				{
                    this.showError(error)
                    reject(error)
                })
                .finally( () => 
                {
                    this.loading = false
                });
			})

        },

        updateResource(resourceID, data)
        {
           if(!this.preFormActions('update')) {
                return new Promise(() => 
                {
                    this.showError('Favor validar los datos')
                    this.loading = false
                })  
            } 
            
            return new Promise((resolve, reject) => 
			{
				axios.put(this.apiUrl + resourceID, data)
				.then(response => 
				{
                    this.loading = false;

                    resolve(response.data)
				})
				.catch(error => 
				{
					this.showError(error)
                })
                .finally( () => 
                {
                    this.loading = false
                });
			})
        },

        preFormActions(action)
        {
            let validate = true
           
            if(action != 'delete' && this.validateForm )
            {
                if(this.$refs.form)
                {
                    validate = this.$refs.form.validate()
                }
            }
            this.setDefaults()
            this.loading = true;
            return validate
        },

        mapForm()
        {
            if(this.item)
            {
                this.mapData(this.item)
            }else
            {
               this.clear()
            }
        },

        mapData(data)
        {
            if(data)
            {
                for(var key in data)
                {
                    if(this.form.hasOwnProperty(key))
                    {
                        if(key.includes('fe_'))
                        {
                            this.dates[key] =  this.formatDate(data[key]);
							
                            if(data[key])
                            {
                                this.form[key]  = data[key].substr(0, 10);
                            }
							
                        } else {
							
							this.form[key]  =  data[key];
						}
                    }
                }
            }
        },

        setDefaults()
        {
            for(var key in this.default)
            {
                this.form[key]  =  this.default[key];
            }

            if(this.form)  this.form.id_usuario = this.idUser
        },

        clear()
        {
            for(var key in this.dates)
            {
                this.dates[key] = '';
            }

            for(var key in this.form)
            {
                this.form[key] = '';
            }

            this.$refs.form.resetValidation();

            this.form.id_usuario = this.idUser
        },

        
         
    }
}
