export default
{
	state(){
		return	{

			colegio: null,

			colegios: [],

			colegioById: null,

		}
	},

	getters:
	{
		getColegios: state => state.colegios,
                
		countColegios: state => state.colegios.length,
		
		getColegio: state => state.colegio,

		getColegioId: state =>  (state.colegio) ? state.colegio.id : null,

		getColegioOpen:  state => (state.colegio) ? state.colegio.bo_abierto : null,
	
		getColegioById: state => state.colegioById,

	},

	mutations:
	{
		setColegios (state, colegios)
        {
            state.colegios 	= colegios
        },

		delColegios (state, colegios)
        {
            state.colegios 	= colegios
		},

		insColegios(state, colegios)
        {
            state.colegios 	= colegios
		},

		setColegio (state, colegio)
        {
            state.colegio 	= colegio
		},

		setOpenCloseColegio (state, openClose)
		{
			state.colegio.bo_abierto = openClose
		},
		
		setColegiobyId (state, colegio)
        {
			state.colegioById 	= colegio
			state.colegios     = [colegio]
		},

	},

	actions:
	{
		apiColegioUsuario( { commit }, idUsuario )
		{
			return new Promise((resolve, reject) => 
			{
				axios.get('/api/v1/' + 'colegio/usuario/' + idUsuario)
				.then(response => 
				{
					commit('setColegio', response.data)
					commit('setCalendario', response.data.calendario)
					resolve(response)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
		},

		apiStoreColegio({ commit }, form )
		{
			return new Promise((resolve, reject) => 
			{
				axios.post('/api/v1/colegio', form)
				.then(response => 
				{
					commit('setColegio', response.data[0].colegio)
					commit('setCalendario', response.data[0].calendario)
					resolve(response.data)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
		},

		apiUpdateColegio({ commit }, colegio )
		{
			return new Promise((resolve, reject) => 
			{
				axios.put('/api/v1/colegio/' + colegio.id, colegio.form)
				.then(response => 
				{
					commit('setColegio', response.data[0].colegio)
					resolve(response.data)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
		},

		apiLocationColegio({ commit }, colegio )
		{
			return new Promise((resolve, reject) => 
			{
				axios.put('/api/v1/colegio/location/' + colegio.id, colegio.form)
				.then(response => 
				{
					commit('setColegio', response.data[0].colegio)
					resolve(response.data)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
		}

	}
}