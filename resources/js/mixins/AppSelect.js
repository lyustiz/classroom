
export default {
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
                
                axios.spread( (...dataLists) => 
                {
                    let i = 0;
                    for(var key in this.selects) 
                    {
                        this.selects[key] = dataLists[i].data
                        i++;
                    }
                })
            )
            .catch(error =>{
            
                this.showError(error);

            })
            .finally( () =>
            {
                this.loading = false;
            });
        },

        selectRequests(selects) 
        {
            let requests = [];

            for(var select in selects) 
            {
                let param = (selects[select]) ? selects[select] : '';

                requests.push(axios.get(this.$App.apiUrl + select + param));
            }

            return axios.all(requests)
            
        },
    } 
}