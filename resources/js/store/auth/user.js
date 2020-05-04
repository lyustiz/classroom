export default
{
	state(){
		return{
			iduser: null,
			username: null,
			user: null,
			auth: null,
		}
	},

	getters:
	{
		iduser:   state => state.iduser,
		username: state => state.username,
		getUser:  state => state.user,
		getAuth:  state => state.auth,
	},

	mutations:
	{
		setUser (state, user)
        {
			state.user 	   = user
			state.iduser   = user.id_usuario
			state.username = user.nb_usuario
		},
		
		setAuth (state, auth)
        {
            state.auth 	= auth
		},
		
		setIdUsuario(state, iduser)
		{
			state.iduser  = iduser
		},

		setNbUsuario(state, username)
		{
			state.username = username
		},
	}
}
