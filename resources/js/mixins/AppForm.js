import AppFormat  from './AppFormat';
import AppRules   from './AppRules'
import AppSelect  from './AppSelect'
import AppMessage from './AppMessage'

export default 
{
    mixins: [AppFormat, AppRules, AppSelect, AppMessage],

    props: {
        item: {
            type: Object,
            default: null
        },
        action: {
            type: String,
            default: null
        },
		title: {
            type: String,
            default: null
        },
        clear:{
            type: Boolean,
            default: false
        },
	},

    data() 
    {
        return {
            valid:       true,
            calendar:    false,
            dates:       {},
            loading:     true,
            default:     {},
            defaultForm: {
                id_status: 1
            },
        }
    },

    created()
    {
        this.fillSelects()

        this.setDataForm(this.action)

        this.onCreateForm()
    },

    watch: 
    {
        action (value)
        {
            this.setDataForm(value)

            this.preActionForms()
        },
        
    },

	computed: 
	{
        idUser()
        {
            return this.$store.getters['getUserid']
        },
        
        apiUrl() 
		{
            return this.$App.apiUrl;
        },
        
        fullUrl() 
		{
            return this.$App.apiUrl + this.resource;
        },
		
        fullUrlId() 
		{
            return this.fullUrl + '/' + this.item.id
        },
    },

    methods: 
	{
        mapForm()
        {
            if(this.item)
            {
                for(var key in this.item)
                {
                    if(this.form.hasOwnProperty(key))
                    {
                        if(key.includes('fe_') && ((this.item[key]) ? this.item[key].length : 0 > 9))
                        {
                            this.dates[key] =  this.formatDate(this.item[key]);
							
							this.form[key] = this.item[key].substr(0, 10);
							
                        } else {
							
							this.form[key]  =  this.item[key];
						}
                    }
                }
            }else {
                
               this.reset()
            }
        },
        
        setDataForm(action)
        {
            if(this.action == 'upd') this.mapForm()
         
            if(this.action == 'ins') this.reset()

            if(!this.action) this.reset()
     
            if(action) this.setDefaultForm()
        },

		store() 
		{
            this.extraActions('store')
            
            if (!this.$refs.form.validate())  return 

            this.setDefaults()
			
            this.loading = true;

            this.form.id_usuario = this.idUser 
				
            axios.post(this.fullUrl, this.form)
            .then(response => 
            {
                this.validResponse(response)
            })
            .catch(error => 
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false;

                this.postResponse()
            });
        },
		
        update() 
		{
            this.extraActions('update')
            
            if (!this.$refs.form.validate())  return 

            this.setDefaults()

            this.loading = true;

            this.form.id_usuario = this.idUser
            
            axios.put(this.fullUrlId, this.form)
            .then(response => 
            {
                this.validResponse(response)
            })
            .catch(error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false

                this.postResponse()
            }); 
        },
        
        reset()
        {
            if(this.action == 'upd')
            {
                this.mapForm()
            }
            else
            {
                for(var key in this.form)
                {
                    this.form[key]  = null;
                }

                for(var key in this.dates)
                {
                    this.dates[key] = null;
                }
                
                if(this.$refs.form)
                {
                    this.$refs.form.reset();
                }
            }
            this.form.id_usuario = this.idUser
            
        },
		
        cancel()
        {
            this.$emit('closeModal');

            this.reset();
        },

        setDefaults()
        {
            for(var key in this.default)
            {
                this.form[key]  =  this.default[key];
            }

            this.form.id_usuario = this.idUser
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

        onCreateForm()
        {
            //acciones al crearse el formulario
        },

        extraActions(method)
        {
             //acciones extra antes de ejecutar insert/update methods
        },

        preActionForms()
        {
            //funcion para ejecutar al cambiar acciones del formulario
        },

        postResponse()
        {
            //funcion para ejecutar despues de las respuestas de store/update
        },

        setDefaultForm() 
        {
            for(var key in this.defaultForm)
            {
                this.form[key]  = (this.form[key]) ? this.form[key] : this.defaultForm[key];
            }
        },


        //TODO: PENDIENTE REFACTORIIZAR appform extiende de appdata

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

    }
}
