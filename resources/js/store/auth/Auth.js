export default
{
	state(){
		return{
			token:  	null,
			expire:     null,
			auth: 		false,
			user: 		null,
			userid: 	1,
			username: 	null,
			profile:	null,
			profiles: 	[],
			modulos:    [],
			menus:    [],
		}
	},

	getters:
	{
		getToken:   	state => state.token,
		getExpire:   	state => state.expire,
		getAuth: 		state => state.auth,
		getUser:  		state => state.user,
		getUserid:  	state => state.userid,
		getUsername:  	state => state.username,
		getProfile:   	state => state.profile,
		getProfiles:   	state => state.profiles,
		getFoto:   	    state => state.user.foto,
		getAlumno:   	state => state.user.alumno,
		getDocente:   	state => state.user.docente,
		getPariente:   	state => state.user.pariente,
		getEmpleado:   	state => state.user.empleado,
		getModules:   	state => state.user.modules,
	},

	mutations:
	{
		setToken (state, token)
        {
			state.token		= token
			localStorage.setItem("token", 	token)
		},

		setExpire (state, expire)
		{
			state.expire 	= expire
			localStorage.setItem("expire", 	expire)
		},
		
		setAuth (state, auth)
        {
			state.auth 		= auth
			localStorage.setItem("auth", 	auth)
		},
		
		setUser(state, user)
		{
			state.user  	= user
			state.userid   	= user.id
			state.username 	= user.nb_usuario
			localStorage.setItem("user", (user)  ? JSON.stringify(user): null)			
		},

		setUserid(state, userid)
		{
			state.userid   = userid
		},

		setUsername(state, username)
		{
			state.username = username
		},

		setProfile (state, profile)
        {
			state.profile  = profile
		},

		setProfiles (state, profiles)
        {
			state.profiles	= profiles
			state.profile   = profiles[0]
			localStorage.setItem("profiles", (profiles)  ? JSON.stringify(profiles): null	)
		},

		setFoto (state, foto)
		{
			state.user.foto  = foto
			localStorage.setItem("user", state.user)
		},

		setModules (state, modules)
        {
			state.modules	= modules
			localStorage.setItem("modules", (modules)  ? JSON.stringify(modules): null	)
		},
    },
    
    actions:
    {
        login( { dispatch }, credentials )
		{
			return new Promise((resolve, reject) => 
			{
				axios.post('/api/' + 'login', credentials)
				.then(response => 
				{
					if (response.status == 200)
					{
						const 	data = {
									user: 	  response.data.user,
									token: 	  response.data.auth,
									expire:   response.data.expires_in,
									profiles: response.data.profiles,
								};

						dispatch('autenticate', data)
						resolve( { status: 200, userType: response.data.user.id_tipo_usuario } )
					}
					else{

						dispatch('unatenticate')
						reject(response)
					}
					
				})
				.catch(error => 
				{
					dispatch('unatenticate')
					reject(error)
				})
			})
        },
		
		verify( { commit }, form )
		{
			return new Promise((resolve, reject) => 
			{
				axios.post('/api/' + 'verify', form)
				.then(response => 
				{
					resolve(response)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
		},
		
		resendEmail( { commit }, form )
		{
			return new Promise((resolve, reject) => 
			{
				axios.post('/api/' + 'email/resend', form)
				.then(response => 
				{
					resolve(response)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
        },
        
        logout( { dispatch } )
		{
			return new Promise((resolve, reject) => 
			{
				axios.post('/api/' + 'logout')
				.then(response => 
				{
					resolve(response)
				})
				.catch(error => 
				{
					reject(error)
				})
				.then()
				{
					dispatch('unatenticate')
				}
			})
        },
        
        recoverPassword( { commit }, form )
		{
			return new Promise((resolve, reject) => 
			{
				axios.post('/api/' + 'recover/password', form)
				.then(response => 
				{
					resolve(response)
				})
				.catch(error => 
				{
					reject(error)
				})
			})
        },
        
        resetPassword( { commit }, form )
		{
			return new Promise((resolve, reject) => 
			{
				axios.post('/api/' + 'reset/password' , form) 
				.then( response =>
				{
					resolve(response)
				})
				.catch( error =>
				{
					reject(error)
				})
			})
		},

		autenticate({ commit, dispatch }, data)
		{
			commit('setUser'  	 , data.user);
			commit('setToken' 	 , data.token);
			commit('setExpire'   , data.expire);
			commit('setProfiles' , data.profiles);
			commit('setAuth'  	 , true);
		},

		unatenticate({ commit })
		{
			commit('setUser'  	 , { id: null, nb_usuario: null } );
			commit('setToken' 	 , null);
			commit('setExpire'   , null);
			commit('setProfiles' , []);
			commit('setProfiles' , []);
			commit('setAuth'  	 , false);

			localStorage.clear()
			localStorage.setItem("auth", 	false)
		}

    }
}
