import AppFormat  from './AppFormat';

export default 
{
    mixins: [AppFormat],

    props:
    {
        inDialog: {
            type:       Boolean,
            default:    false
        },
    },

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
            confirm:   false
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

            let url = this.deleteUrl()

            axios.delete(url)
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
        },

        deleteUrl()
        {
            return this.fullUrlId
        },

        list()
        {
            let url = this.listUrl()
            
            this.loading = true

            axios.get(url)
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

        listUrl()
        {
            return this.fullUrl
        },

        changeStatus(payload) //deprecated
        {
            this.loading = true
            setInterval(() => { 
                    this.loading = false
                
            }, 3000);
            console.log('changeStatus', payload)
        },

        //acciones de los menus

        onMenu(menu) //compatibilidad versiones anteriores
        {
            switch (menu.action) {
                case 'refresh':
                    this.list()
                    break;
            
                default:
                    break;
            }
        },

        onItemMenu(menu)
        {
            try {
                this[menu.action](menu.item)
            } catch (error) 
            {
                console.log(error, menu)
            }
        },

        onListMenu(menu)
        {
            try {
                this[menu.action]()
            } catch (error) 
            {
                console.log(error, menu)
            }
        },
    }
}
