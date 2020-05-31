import AppFormat  from './AppFormat';
import AppRules  from './AppRules';
export default 
{
    mixins: [AppFormat, AppRules],
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
            path:    null,
            modal:   false,
            dialog:  false
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
            this.loading = true

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
            this.loading = true

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
            this.loading = true

            return new Promise((resolve, reject) => 
			{
				axios.put(this.apiUrl + resourceID, data)
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
         
    }
}
