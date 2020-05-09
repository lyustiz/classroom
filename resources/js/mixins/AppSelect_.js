
export default {
    created()
    {
        this.fillSelects()
    },
    data() 
    {
        return{

        }
    },
    methods:
    { 
        fillSelects()
        {
            this.selectRequests(this.selects)
            .then(
                axios.spread( (...dataSelects) => 
                {
                    let i = 0;
                    for(var key in this.selects) 
                    {
                        if(typeof dataSelects[i].data == "object")
						{
                            this.selects[key].items = dataSelects[i].data
                        }else
                        {
                            this.selects[key].items = []
                        }
                        i++;
                    }
                })
            )
            .catch(error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false;
            });;
        },
        selectRequests(selects) 
        {
            let requests = [];

            for(var select in selects) 
            {
                requests.push(
                    axios.get(
                        this.$App.baseUrl + select + selects[select].group
                    )
                ); 
            }
            return axios.all(requests)
                    
        },
    } 
}