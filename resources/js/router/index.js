import Vue    from 'vue'
import Router from 'vue-router'
Vue.use(Router)

import Welcome          from  '@pages/welcome/Welcome.vue';
import Conocenos        from  '@pages/conocenos/Conocenos.vue';
import Servicios        from  '@pages/servicios/Servicios.vue';
import AccountDasboard  from  '@pages/account/AccountDasboard.vue';
import Home             from  '@pages/home';
import MapView          from  '@pages/map/Mapview';

import SelectCuenta     from  '@pages/registro/SelectCuenta.vue';
import RegistroComercio from  '@pages/registro/RegistroComercio.vue';
import RegistroUsuario  from  '@pages/registro/RegistroUsuario.vue';
import Verify           from  '@pages/registro/Verify.vue';
import Login            from  '@pages/login/Login.vue';
import Authentication   from  '@pages/login/Authentication.vue';
import RecoverPassword  from  '@pages/login/RecoverPassword.vue';

import PageNotFound     from  '@pages/404/NotFound.vue'

let isAuthenticated = true;
export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
      routes: [
        {
          path: '/',
          name: 'welcome',
          icon: 'bubble_chart',
          component: Welcome,
        },
        {
          path: '/conocenos',
          name: 'conocenos',
          icon: 'bubble_chart',
          component: Conocenos,
        },
        {
          path: '/servicios',
          name: 'servicios',
          icon: 'bubble_chart',
          component: Servicios,
        },
        {
          path: '/tipocuenta',
          name: 'registro',
          icon: 'bubble_chart',
          component: SelectCuenta,
        },
        {
          path: '/registro-comercio',
          name: 'registro_comercio',
          icon: 'bubble_chart',
          component: RegistroComercio,
        },
        {
          path: '/registro-usuario',
          name: 'registro_usuario',
          icon: 'bubble_chart',
          component: RegistroUsuario,
        },
        {
          path: '/verify/:hash',
          name: 'verify',
          icon: 'bubble_chart',
          component: Verify,
        },
        {
          path: '/login',
          name: 'login',
          icon: 'bubble_chart',
          component: Login,
        },
        {
          path: '/authentication',
          name: 'authentication',
          icon: 'bubble_chart',
          component: Authentication,
        },
        {
          path: '/recover-password',
          name: 'recover',
          icon: 'bubble_chart',
          component: RecoverPassword,
        },
        {
          path: '/cuenta',
          name: 'cuenta',
          icon: 'bubble_chart',
          component: AccountDasboard,
          beforeEnter: (to, from, next) => {
            if (to.name == 'cuenta' && !isAuthenticated) next({ name: 'login' })
            next()
          }
        },
        {
          path: '/home',
          name: 'home',
          icon: 'bubble_chart',
          component: Home,
        },
        {
          path: '/mapview',
          name: 'mapview',
          icon: 'bubble_chart',
          component: MapView,
        },
        { 
          path: "*", 
          name: 'notfound',
          component: PageNotFound 
        }
    ]
})


