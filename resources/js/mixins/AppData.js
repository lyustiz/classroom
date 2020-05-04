export default 
{
    methods:
    { 
        getDataList(dataList)
        {
            this.selectRequests(dataList)
            .then(
                axios.spread( (...dataSelects) => 
                {
                    let i = 0;
                    for(var key in dataList) 
                    {
                        if(typeof dataSelects[i].data == "object")
						{
                            dataList[key].items = dataSelects[i].data
                        }else
                        {
                            dataList[key].items = []
                        }
                        i++;
                    }
                })
            )
            .catch(error =>
            {
               console.log(this.$App.ApiUrl)
               this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false;
                this.dataReady();
            });;
        },
        selectRequests(dataList) 
        {
            let requests = [];

            for(var select in dataList) 
            {
                requests.push(
                    axios.get(
                        this.$App.ApiUrl + select + dataList[select].group
                    )
                ); 
            }
            return axios.all(requests)
                    
        },
        dataReady(){
            
        }
    } 
}
