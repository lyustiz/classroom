import Vue from 'vue';

//layouts
import LoginLayout   from '@components/layouts/LoginLayout'
import MainLayout    from '@components/layouts/MainLayout'
import AppToolbar    from '@components/app/AppToolbar'
import Login 		 from '@components/app/AppLogin'

Vue.component('login-layout',     LoginLayout);
Vue.component('main-layout',      MainLayout);
Vue.component('app-toolbar',      AppToolbar);
Vue.component('app-login',        Login);

//Global Componets
import ListButtons   from '@components/list/ListButtons'
import AddButton     from '@components/list/AddButton'
import ListContainer from '@components/list/ListContainer'
import StatusSwitch  from '@components/list/StatusSwitch'
import FormModal     from '@components/form/FormModal'
import FormButtons   from '@components/form/FormButton'
import FormDelete    from '@components/form/FormDelete'
import AppMessage    from '@components/app/AppMessage'
import AppModal      from '@components/app/AppModal'
import AppDialog     from '@components/app/AppDialog'
import AppUser       from '@components/app/AppUser'

Vue.component('list-buttons',     ListButtons);
Vue.component('add-button',       AddButton);
Vue.component('list-container',   ListContainer);
Vue.component('status-switch',    StatusSwitch);
Vue.component('form-modal',       FormModal);
Vue.component('form-buttons',     FormButtons);
Vue.component('form-delete',      FormDelete);
Vue.component('app-message',      AppMessage);
Vue.component('app-modal',        AppModal);
Vue.component('app-dialog',       AppDialog);
Vue.component('app-user',         AppUser);