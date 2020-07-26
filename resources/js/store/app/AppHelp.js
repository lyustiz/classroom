export default
{
	state(){
		return{
			showAsistente: 	false,
		}
	},

	getters:
	{
		getShowAsistente:  	state => state.showAsistente,
	},

	mutations:
	{
		setShowAsistente (state, show) {
			state.showAsistente = show
        },
	}
}