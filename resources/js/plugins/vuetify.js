import Vue from 'vue';
import Vuetify from 'vuetify';
import es from 'vuetify/es5/locale/es'

Vue.use(Vuetify);


export default new Vuetify({
    lang: {
        locales: { es }, 
        current: 'es',
    },
    theme: {
        options: {
            customProperties: true,
          },
        themes: {
            light: {
                primary:    '#2196f3',
                secondary:  '#03a9f4',
                accent:     '#3f51b5',
                error:      '#f44336',
                warning:    '#ffc107',
                info:       '#00bcd4',
                success:    '#4caf50',
                background: '#ffffff'
            },
        },
    },
    /* icons: {
        iconfont: 'mdi',
    }, */

});
