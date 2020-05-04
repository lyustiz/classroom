export default
{
	state(){
		return	{
			zonas: [ ],
		}
	},

	getters:
	{
		getZonasAll: state => state.zonas,

		getZonas:   state  => state.zonas.filter( zona => zona.id != 7 ),
		
	},

	mutations:
	{
		setZonas (state, zonas)
        {
            state.zonas 	= zonas
		},

		delZonas (state, Zonas)
        {
            state.zonas 	= zonas
		},

		insZonas(state, zonas)
        {
            state.zonas 	= zonas
		},
	},

	actions:
	{

		apiZonas( { commit } )
		{
			axios.get('/api/v1/' + 'zona')
			.then( response =>
			{
				commit('setZonas', response.data)
			})
            .catch( error =>
            {
              console.log(error)
            })
		}

	}
}