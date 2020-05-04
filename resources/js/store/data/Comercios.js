export default
{
	state(){
		return	{

			comercio: null,

			comercios: [],

			comercioById: null,

			comercioCali: false

		}
	},

	getters:
	{
		getComercios: state => state.comercios,
                
		countComercios: state => state.comercios.length,
		
		getComercio: state => state.comercio,

		getComercioId: state =>  (state.comercio) ? state.comercio.id : null,

		getComercioOpen:  state => (state.comercio) ? state.comercio.bo_abierto : null,
	
		getComercioById: state => state.comercioById,

		getComercioCali: state => state.comercioCali,
	},

	mutations:
	{
		setComercios (state, comercios)
        {
            state.comercios 	= comercios
        },

		delComercios (state, comercios)
        {
            state.comercios 	= comercios
		},

		insComercios(state, comercios)
        {
            state.comercios 	= comercios
		},

		setComercio (state, comercio)
        {
            state.comercio 	= comercio
		},

		setOpenCloseComercio (state, openClose)
		{
			state.comercio.bo_abierto = openClose
		},
		
		setComerciobyId (state, comercio)
        {
			state.comercioById 	= comercio
			state.comercios     = [comercio]
		},

		setComercioCali (state, isCali)
        {
			state.comercioCali 	= isCali
		},
	},

	actions:
	{

		apiComerciosCategoria( { commit }, {categoria, tipoDespacho}  )
		{
			if(!categoria)
			{
				commit('setComercios', [])
				return
			}

			axios.get('/api/v1/' + 'comercio/categoria/' + categoria + '/' + tipoDespacho )
			.then( response =>
			{
				commit('setComercios', response.data)
			})
            .catch( error =>
            {
              console.log(error)
            })
		},

		apiComercioUsuario( { commit }, idUsuario )
		{
			return new Promise((resolve, reject) => 
			{
				axios.get('/api/v1/' + 'comercio/usuario/' + idUsuario)
				.then(response => 
				{
					commit('setComercio', response.data)
					resolve(response)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
		},

		apiComerciosNombre( { commit }, barrio )
		{
			if(!barrio)
			{
				commit('setComercios', [])
				return
			}

			axios.get('/api/v1/' + 'comercio/barrio/' + barrio)
			.then( response =>
			{
				commit('setComercios', response.data)
			})
            .catch( error =>
            {
              console.log(error)
            })
		},

		apiComercioById( { commit }, comercioId )
		{
			if(!comercioId)
			{
				commit('setComerciobyId', null)
				return
			}

			axios.get('/api/v1/' + 'comercio/' + comercioId)
			.then( response =>
			{
				commit('setComerciobyId', response.data)
			})
            .catch( error =>
            {
              console.log(error)
            })
		},

		apiOpenCloseComercio({ commit }, openclose )
		{
			return new Promise((resolve, reject) => 
			{
				axios.put('/api/v1/' + 'comercio/' + openclose.id_comercio + '/openclose', openclose)
				.then(response => 
				{
					commit('setOpenCloseComercio', response.data.openclose)
					resolve(response)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
		}

	}
}