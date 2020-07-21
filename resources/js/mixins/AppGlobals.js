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
        },

        navegateToName(routeName)
        {
            this.$router.push({ name: routeName }).catch(err => {})
        }

        
    }
}
