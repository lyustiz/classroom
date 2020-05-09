import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import AppMessage from '@store/app/AppMessage';
import AppLayout  from '@store/app/AppLayout';

//Auth
import Auth       from '@store/auth/Auth';

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
    modules: {
        AppMessage,
        AppLayout,

        //Auth
        Auth,
    },
    strict: debug
})
