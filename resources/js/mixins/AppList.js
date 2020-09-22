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

       
    }
}
