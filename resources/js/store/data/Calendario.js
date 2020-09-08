export default
{
	state(){
		return	{

			calendario: null,

			calendarios: [],

			calendarioById: null,

			periodoActivo: null

		}
	},

	getters:
	{
		getCalendarios: state => state.calendarios,
                
		countCalendario: state => state.calendarios.length,
		
		getCalendario: state => state.calendario,

		getCalendarioId: state =>  (state.calendario) ? state.calendario.id : null,
	
		getCalendarioById: state => state.calendarioById,

		getPeriodoActivo: state => state.periodoActivo,

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
			state.calendarioById  = calendario
			state.calendarios     = [calendario]
		},

		setPeriodoActivo (state, periodo)
        {
			state.periodoActivo = periodo
		},
	},
}