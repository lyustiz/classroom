import Vue  from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

//app
import AppMessage from '@store/app/AppMessage';
import AppLayout  from '@store/app/AppLayout';
import AppHelp    from '@store/app/AppHelp';

//data
import Colegio    from '@store/data/Colegio';
import Calendario from '@store/data/Calendario';

//auth
import Auth       from '@store/auth/Auth';
import Pusher     from '@store/auth/Pusher';

//meet
import AppMeet    from '@store/app/AppMeet';

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
    modules: {
        
        //app
        AppMessage,
        AppLayout,
        AppHelp,

        //data
        Colegio,
        Calendario,

        //Auth
        Auth,
        Pusher,

        //meet
        AppMeet
    },
    strict: debug
})
