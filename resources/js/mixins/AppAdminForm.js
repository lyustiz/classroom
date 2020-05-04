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
            idUser:     this.$store.getters.idUser,
            valid:      true,
            calendar:   false,
            dates:      {},
            loading:    true
        }
    },

    created()
    {
        this.fillSelects()

        this.setDataForm(this.action)
    },

    watch: 
    {
        action (value)
        {
            this.setDataForm(value)
        },
    },

	computed: 
	{
        fullUrl() 
		{
            return this.$App.baseUrl + this.resource;
        },
		
        fullUrlId() 
		{
            return this.fullUrl + '/' + this.item['id_' + this.resource]
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
                        if(key.includes('fe_') && this.item[key].length > 10)
                        {
                            this.dates[key] =  this.formatDate(this.item[key]);
							
							this.form[key] = this.item[key].substr(0, 10);
							
                        } else {
							
							this.form[key]  =  this.item[key];
						}
                    }
                }
            }else
            {
               this.reset()
            }
        },
        
        setDataForm(action)
        {
            if(this.action == 'upd')
            {
                this.mapForm()
            }
            else if(this.action == 'ins')
            {
                this.reset()
            }
        },

		store() 
		{
            if (!this.$refs.form.validate())  return 
			
            this.loading = true;
				
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
            });
        },
		
        update() 
		{
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            
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
                    this.form[key] = null;
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
    }
}
