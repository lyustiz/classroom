export default
{
	state(){
		return	{

			calendario: null,

			calendarios: [],

			calendarioById: null,

		}
	},

	getters:
	{
		getCalendarios: state => state.calendarios,
                
		countCalendario: state => state.calendarios.length,
		
		getCalendario: state => state.calendario,

		getCalendarioId: state =>  (state.calendario) ? state.calendario.id : null,
	
		getCalendarioById: state => state.calendarioById,

	},

	mutations:
	{
		setCalendarios (state, calendario)
        {
            state.calendarios 	= calendarios
        },

		delCalendario (state, calendarios)
        {
            state.calendarios 	= calendarios
		},

		insCalendario(state, calendarios)
        {
            state.calendarios 	= calendarios
		},

		setCalendario (state, calendario)
        {
			state.calendario 	= calendario
			localStorage.setItem("calendario", (calendario)  ? JSON.stringify(calendario): ''	)
		},
		
		setCalendariobyId (state, calendario)
        {
			state.calendarioById 	= calendario
			state.calendarios     = [calendario]
		},

	},
}