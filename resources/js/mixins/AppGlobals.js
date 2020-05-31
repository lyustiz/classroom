export default 
{
    data()
    {
        return{

        }
    },
    
    methods: 
    {
        navegateTo(route)
        {
            this.$router.push(route).catch(err => {})
        }
    }
}
