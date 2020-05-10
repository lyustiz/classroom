export default 
{
    methods: 
    {
        navegateTo(route)
        {
            this.$router.push(route).catch(err => {})
        }
    }
}
