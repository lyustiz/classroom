import AppFormat  from './AppFormat';
import AppRules   from './AppRules';
export default 
{
    mixins: [AppFormat, AppRules],

    props:
    {
        inDialog: {
            type:       Boolean,
            default:    false
        },
    },
    
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
            loading: true,
            items:   [],
            search:  null,
            item:    null,
            path:    null,
            modal:   false,
            dialog:  false,
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
                })
                .finally( () => 
                {
                    this.loading = false
                });
			})

        },

        deleteResource(resourceID)
        {
            this.preFormActions('delete')

            return new Promise((resolve, reject) => 
			{
				axios.delete(this.apiUrl + resourceID)
				.then(response => 
				{
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

        storeResource(resource, data)
        {
            this.preFormActions('store')

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
                })
                .finally( () => 
                {
                    this.loading = false
                });
			})

        },

        updateResource(resourceID, data)
        {
            this.preFormActions('update')

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

        preFormActions(action)
        {
           
            if(action != 'delete' && this.validateForm )
            {
                if (!this.$refs.form.validate())  return 
            }

            this.setDefaults()

            this.loading = true;
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
