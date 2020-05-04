export default
{
	state(){
		return	{
			categorias: [ ],
		}
	},

	getters:
	{
		getCategorias: state => state.categorias,

		getCategoriaById: (state) => (id) => {

			let category = state.categorias.find(categoria => categoria.id === id)

			return (category) ? category : {tx_icono: 'mdi-close-outline', nb_categoria: 'No seleccionado'}
		}
	},

	mutations:
	{
		setCategorias (state, categorias)
        {
            state.categorias 	= categorias
		},

		delCategoria (state, categorias)
        {
            state.categorias 	= categorias
		},

		insCategoria(state, categorias)
        {
            state.categorias 	= categorias
		},
	},

	actions:
	{

		apiCategorias( { commit } )
		{
			axios.get('/api/v1/' + 'categoria')
			.then( response =>
			{
				commit('setCategorias', response.data)
			})
            .catch( error =>
            {
              console.log(error)
            })
		}

	}
}
