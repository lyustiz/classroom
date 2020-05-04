export default
{
	state(){
		return{
			layout: 'principal-layout',
            isMobile: false, //movile
			size:   'xs', //xs, sm, md, lg, xl
			resize: false
		}
	},

	getters:
	{
		getLayout:  state => state.layout,
		getIsMobile:  state => state.isMobile,
		getSize:    state => state.size,
		getResize:  state => state.resize,
	},

	mutations:
	{
		setLayout (state, layout) {
			state.layout = layout
        },
        
		setIsMobile(state, isMobile) {
			state.isMobile = isMobile
        },
        
		setSize(state, size) {
			state.size 	= size
		},

		setResize(state, resize) {
			state.resize = resize
		},
		
	}
}