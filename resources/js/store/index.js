import Vue  from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

//app
import AppMessage from '@store/app/AppMessage';
import AppLayout  from '@store/app/AppLayout';

//data
import Colegio    from '@store/data/Colegio';

//auth
import Auth       from '@store/auth/Auth';

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
    modules: {
        
        //app
        AppMessage,
        AppLayout,

        //data
        Colegio,

        //Auth
        Auth,
    },
    strict: debug
})
