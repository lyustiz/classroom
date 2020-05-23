import AppFormat  from './AppFormat';
export default 
{
    mixins: [AppFormat],
    computed: 
    {
        fullUrl() 
        {
            return this.apiUrl + this.path;
        },
        fullUrlId() 
        {
            return this.fullUrl + '/' + this.item.id
        }
    },

    data() 
    {
        return {
            apiUrl:  this.$App.apiUrl,
            idUser:  this.$store.getters.idUser,
            loading: true,
            items:   [],
            path:    null
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
         
    }
}
