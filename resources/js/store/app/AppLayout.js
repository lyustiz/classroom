export default
{
	state(){
		return{
			layout: 	'main-layout',
			size:   	'xs', //xs, sm, md, lg, xl
			isMobile: 	false, 
			resize: 	false,
			iconMenu: 	false,
			toggleMenu: true
		}
	},

	getters:
	{
		getLayout:  	state => state.layout,
		getIsMobile:  	state => state.isMobile,
		getSize:    	state => state.size,
		getResize:  	state => state.resize,
		getIconMenu:	state => state.iconMenu,
		getToggleMenu:	state => state.toggleMenu,
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

		setIconMenu(state, active) {
			state.iconMenu = active
		}, 

		setToggleMenu(state, active) {
			state.toggleMenu = active
		} 
	}
}