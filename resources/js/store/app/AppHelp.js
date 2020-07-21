export default
{
	state(){
		return{
			showAsistente: 	true,
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