import Vue from 'vue';

//layouts
import LoginLayout   from '@components/layouts/LoginLayout'
import PpalLayout    from '@components/layouts/PrincipalLayout'
import AppToolbar    from '@components/app/AppToolbar'
import AppFilters    from '@components/app/AppFilters'
import Login 		 from '@components/app/AppLogin'

Vue.component('login-layout',     LoginLayout);
Vue.component('principal-layout', PpalLayout);
Vue.component('app-toolbar',      AppToolbar);
Vue.component('app-filters',      AppFilters);
Vue.component('app-login',        Login);

//Global Componets
import ListButtons   from '@components/list/ListButton'
import AddButton     from '@components/list/AddButton'
import ListContainer from '@components/list/ListContainer'
import AppForm       from '@components/form/AppForm'
import FormButtons   from '@components/form/FormButton'
import FormDelete    from '@components/form/FormDelete'
import AppMensaje    from '@components/app/AppMensaje'
import AppModal      from '@components/app/AppModal'
import AppDialog     from '@components/app/AppDialog'
import AppIconButtom from '@components/app/AppIconButtom'
import AppUser       from '@components/app/AppUser'

Vue.component('list-buttons',     ListButtons);
Vue.component('add-button',       AddButton);
Vue.component('list-container',   ListContainer);
Vue.component('app-form',         AppForm);
Vue.component('form-buttons',     FormButtons);
Vue.component('form-delete',      FormDelete);
Vue.component('app-message',      AppMensaje);
Vue.component('app-modal',        AppModal);
Vue.component('app-dialog',       AppDialog);
Vue.component('app-icon-buttom',  AppIconButtom);
Vue.component('app-user',         AppUser);