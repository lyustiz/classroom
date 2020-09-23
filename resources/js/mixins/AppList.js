import AppFormat  from './AppFormat';

export default 
{
    mixins: [AppFormat],

    data() 
    {
        return {

            apiUrl:    this.$App.apiUrl,
            idUser:    this.$store.getters['getUserid'],
            loading:   true,
            modal:     false,
            items:     [],
            itemsMenu: [],
            item:      {},
            search:    '',
            action:    '',
            dialog:    false,
            confirm:   false,
            autolist:  true
        }
    },

    created()
    {
        (this.autolist) ? this.list() : this.loading = false
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
            this.onDelete()
            
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

        list()
        {
            this.onList()
            
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

        //route setup

        listUrl()
        {
            return this.fullUrl
        },

        deleteUrl()
        {
            return this.fullUrlId
        },

        //hooks

        onList()
        {
            return true
        },

        onDelete()
        {
            return true
        },

        //deprecated
        
        changeStatus(payload) 
        {
            this.loading = true
            setInterval(() => { 
                    this.loading = false
            }, 3000);
            console.log('changeStatus', payload)
        },

       
    }
}
