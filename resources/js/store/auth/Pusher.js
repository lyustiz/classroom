import Pusher  from 'pusher-js';
export default
{
	state(){
		return{
			credentials: null,
            pusher:      null,
            users:       []   
		}
	},

	getters:
	{
        getCredentials: state => state.credentials,

        getPusher:      state => state.pusher,

        getUsers:       state => state.users,
	},

	mutations:
	{
        setCredentials(state, credentials)
        {
			state.credentials = credentials
		},
        
        setPusher (state, pusher)
        {
			state.pusher = pusher
        },
        
        setUsers (state, users)
        {
			state.users = users
		},
    },
    
    actions:
    {
        credentials( { commit }, idUser )
		{
			return new Promise((resolve, reject) => 
			{
				axios.get(`/api/v1/meet/${idUser}`)
				.then(response => 
				{
                    if (response.status == 200)
					{
                        commit('setUsers', response.data.users);
                        commit('setCredentials', { cluster: response.data.pusherCluster, key: response.data.pusherKey });
						resolve( { users: response.data.users } )
					}
					else{
						reject(response)
					}
				})
				.catch(error => 
				{
					reject(error)
				})
			})
        },

        instance( { commit, state }, idUser )
		{
			return new Promise((resolve, reject) => 
			{
                try {
                    let pusher =  new Pusher(state.credentials.key, 
                    {
                        authEndpoint: `/api/v1/meet/auth/${idUser}`,
                        cluster: state.credentials.cluster,
                        auth: {
                                headers: {
                                    'X-CSRF-Token': document.head.querySelector('meta[name="csrf-token"]').content
                                }
                        }
                    });
                    commit('setPusher', true);
                    resolve( pusher )

                } catch (error) {
                    reject(error)
                }
                
			})
        },

    }
}
