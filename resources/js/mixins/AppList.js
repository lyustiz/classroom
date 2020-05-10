import AppFormat  from './AppFormat';
import AppMessage from './AppMessage';

export default 
{
    mixins: [AppFormat, AppMessage],

    data() 
    {
        return {

            apiUrl:    this.$App.apiUrl,
            idUser:    this.$store.getters.idUser,
            loading:   true,
            modal:     false,
            items:     [],
            itemsMenu: [],
            item:      {},
            search:    '',
            action:    '',
            dialog:    false,
        }
    },

    created()
    {
        this.list();
    },

    computed: 
    {
        fullUrl() 
        {
            return this.apiUrl + this.resource;
        },
        fullUrlId() 
        {
            return this.fullUrl + '/' + this.item.id
        }
    },
    
    methods: 
    {
        closeModal()
        {
            this.action = '';
            this.modal  = false;
            this.item   = {};
            this.list();
        },
        insertForm ()
        {
            this.action = 'ins';
            this.modal  = true;
            this.item   = {};
        },
        updateForm (item)
        {
            this.action = 'upd';
            this.modal  = true;
            this.item   = item;
        },
        deleteForm (item)
        {
            this.dialog = true;
            this.item   = item;
        },
        deleteCancel ()
        {
            this.dialog = false;
            this.item   = {};
        },
        deleteItem ()
        {
            if(!this.deleteValidation()) return
            
            this.loading = true

            axios.delete(this.fullUrlId)
            .then(response => 
            {
                this.showMessage(response.data.msj)
                this.item = {};
                this.list();
            })
            .catch(error => 
            {
                this.showError(error)
            })
            .finally( () => 
            {
                this.loading = false
                this.dialog  = false;
            });
        },
        deleteValidation()
        {
            return true
        }
        ,
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
        changeStatus(payload)
        {
            this.loading = true
            setInterval(() => { 
                    this.loading = false
                
            }, 3000);
            console.log('changeStatus', payload)
        },
        onMenu(payload)
        {
            switch (payload) {
                case 'refresh':
                    this.list()
                    break;
            
                default:
                    break;
            }
        }
    }
}
