import Vue      from 'vue';
import router   from './router';
import store    from './store';

/** Plugins **/
import './plugins/axios';
import vuetify from './plugins/vuetify';

let isMobile = {
    Android:    () => navigator.userAgent.match(/Android/i),
    BlackBerry: () => navigator.userAgent.match(/BlackBerry/i),
    iOS:        () => navigator.userAgent.match(/iPhone|iPad|iPod/i),
    Opera:      () => navigator.userAgent.match(/Opera Mini/i),
    Windows:    () => navigator.userAgent.match(/IEMobile/i),
    any:        () => (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows())
}

/** Componente Ppal   **/
import App from './App.vue'
Vue.component('app', App)
 
/** Config **/
Vue.prototype.$App = Object.freeze({
    title:    process.env.MIX_APP_NAME,
    version:  '0.1',
    baseUrl:  '/api/',
    apiUrl:   '/api/v1/',
    debug:    false,
    isMobile: (isMobile.any()) ? true : false,
    device:   isMobile.any(), 
    theme:{
            headApp:    'indigo',
            textTitle:  'white--text',
            headForm:   'red',
            titleForm:  'red lighten-4',
            headList:   'grey lighten-3',
            titleList:  'black--text',
            headModal:  'indigo',
            titleModal: 'white--text',
            button: {
                        insert:  'success',
                        update:  'warning',
                        delete:  'error',
                        reset:   'info',
                        cancel:  'error',
                        new:     'primary',
                        actions: 'primary'
                    }
        }
})

/** Components Autoload **/
import './components/components'

/** Minxins Autoload **/
import AppMessage from '@mixins/AppMessage'
import AppGlobals from '@mixins/AppGlobals'
Vue.mixin(AppMessage)
Vue.mixin(AppGlobals)

/** Componente Principal */
const app = new Vue({
    el: '#app',
    mixins:[ AppMessage ],
    store,
    router,
    vuetify,
});
