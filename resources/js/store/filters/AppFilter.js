export default
{
	state(){
		return{
			nombre:     	null,
			categoria:  	null,
			categoriaCali: 	null,
            zona:       	null,
			barrio:     	null,
			filter:     	true,

		}
	},

	getters:
	{
		getNombre:     state => state.nombre,
		getCategoria:  state => state.categoria,
		getCategoriaCali:  state => state.categoriaCali,
        getZona:       state => state.zona,
		getBarrio:     state => state.barrio,
		showFilter:    state => state.filter,
	},

	mutations:
	{
		setNombre (state, nombre)
        {
            state.nombre = nombre; 
		},

		setCategoria(state, categoria)
		{
			state.categoria  = categoria
		},

		setCategoriaCali(state, categoria)
		{
			state.categoriaCali  = categoria
		},

		setZona(state, zona)
		{
			state.zona   = zona
        },
        
        setBarrio(state, barrio)
		{
			state.barrio = barrio
		},

		toggleFilter(state)
		{
			state.filter = !state.filter
		},
	}
}
