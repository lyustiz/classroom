import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

import AppMessage from '@store/app/AppMessage';
import AppFilter  from '@store/filters/AppFilter';
import AppLayout  from '@store/app/AppLayout';

//Auth
import Auth       from '@store/auth/Auth';

//Data
import Categorias from '@store/data/Categorias';
import Zonas      from '@store/data/Zonas';
import Comercios  from '@store/data/Comercios';


const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
    modules: {
        AppMessage,
        AppFilter,
        AppLayout,

        //Auth
        Auth,

        //Data
        Categorias,
        Zonas,
        Comercios
    },
    strict: debug
})
