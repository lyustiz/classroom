import AppFormat  from './AppFormat';
import AppMessage from './AppMessage';

export default 
{
    mixins: [AppFormat, AppMessage],

    data() 
    {
        return {

            baseUrl:  this.$App.baseUrl,
            idUser:   this.$store.getters.idUser,
            loading:  true,
            modal:    false,
            items:    [],
            item:     {},
            search:   '',
            action:   '',
            dialog:   false,
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
            return this.baseUrl + this.resource;
        },
        fullUrlId() 
        {
            return this.fullUrl + '/' + this.item['id_' + this.resource]
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
        deleteConfirm ()
        {
            this.loading = true
            axios.delete(this.fullUrlId)
            .then(respuesta => 
            {
                this.showMensaje(respuesta.data.msj)
                this.item = {};
                this.dialog = false;
                this.list();
            })
            .catch(error => 
            {
                this.eliminar = error
            })
            .finally( () => 
            {
                this.loading = false
            });
        },
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
        }
    }
}
