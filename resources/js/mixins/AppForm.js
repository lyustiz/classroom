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
            idUser:      1,//this.$store.getters.idUser,
            valid:       true,
            calendar:    false,
            dates:       {},
            loading:     true,
            default:     {},
            defaultForm: {
                id_status: 1
            }
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
                        if(key.includes('fe_') && this.item[key].length > 9)
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
                this.setDefaultForm()
            }

            
        },

		store() 
		{
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
            });
        },
		
        update() 
		{
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
            //this.setDefaultForm()
            
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
        },
        setDefaultForm() 
        {
            for(var key in this.defaultForm)
            {
                this.form[key]  =  this.defaultForm[key];
            }
        },

        formatPicker(date, picker)
        {
            this.pickers[picker] = false;
            return this.formatDate(date)
        },
    }
}
