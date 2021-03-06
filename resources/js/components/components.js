import Vue from 'vue';

//layouts
import LoginLayout   from '@components/layouts/LoginLayout'
import MainLayout    from '@components/layouts/MainLayout'
import WelcomeLayout from '@components/layouts/WelcomeLayout'
import AppToolbar    from '@components/app/AppToolbar'
import Login 		 from '@components/app/AppLogin'

Vue.component('login-layout',     LoginLayout);
Vue.component('main-layout',      MainLayout);
Vue.component('welcome-layout',   WelcomeLayout);
Vue.component('app-toolbar',      AppToolbar);
Vue.component('app-login',        Login);


//Global Componets
import ListIcon       from '@components/list/ListIcon'
import ListSimpleIcon from '@components/list/ListSimpleIcon'
import ListButtons    from '@components/list/ListButtons'
import AppButton      from '@components/app/AppButton'
import AddButton      from '@components/list/AddButton'
import ListContainer  from '@components/list/ListContainer'
import StatusSwitch   from '@components/list/StatusSwitch'
import ListMenu       from '@components/list/ListMenu'
import ItemMenu       from '@components/list/ItemMenu'
import ItemDetail     from '@components/list/ItemDetail'
    
import ReportMenu     from '@components/report/ReportMenu'

import FormModal      from '@components/form/FormModal'
import FormButtons    from '@components/form/FormButton'
import FormDelete     from '@components/form/FormDelete'
    
import AppMessage     from '@components/app/AppMessage'
import AppModal       from '@components/app/AppModal'
import AppDialog      from '@components/app/AppDialog'
import AppConfirm     from '@components/app/AppConfirm'
    
import AppHelp        from '@components/app/AppHelp'
import AppUser        from '@components/app/AppUser'

import AppNotifications   from '@components/app/AppNotifications'
import AppMensajes        from '@components/app/AppMensajes'
import AppSimpleToolbar   from '@components/app/AppSimpleToolbar'

Vue.component('list-icon',        ListIcon);
Vue.component('list-simple-icon', ListSimpleIcon);

Vue.component('list-buttons',     ListButtons);
Vue.component('add-button',       AddButton);
Vue.component('list-container',   ListContainer);
Vue.component('status-switch',    StatusSwitch);
Vue.component('list-menu',        ListMenu);
Vue.component('item-menu',        ItemMenu);
Vue.component('item-detail',      ItemDetail);

Vue.component('report-menu',      ReportMenu);

Vue.component('form-modal',       FormModal);
Vue.component('form-buttons',     FormButtons);
Vue.component('form-delete',      FormDelete);

Vue.component('app-message',      AppMessage);
Vue.component('app-modal',        AppModal);
Vue.component('app-dialog',       AppDialog);
Vue.component('app-confirm',      AppConfirm);

Vue.component('app-help',         AppHelp);
Vue.component('app-user',         AppUser);

Vue.component('app-notifications',  AppNotifications);
Vue.component('app-mensajes',       AppMensajes);
Vue.component('app-simple-toolbar', AppSimpleToolbar);
Vue.component('app-button',         AppButton);

//Tools Components
import AppFoto          from '@pages/foto/appFoto'
import AppFotoCuenta    from '@pages/foto/appFotoCuenta'
import AppAgendaToolbar from '@components/app/AppAgendaToolbar'

import AppTimer         from '@components/app/AppTimer'

Vue.component('app-foto',           AppFoto);
Vue.component('app-foto-cuenta',    AppFotoCuenta);
Vue.component('app-agenda-toolbar', AppAgendaToolbar);
Vue.component('app-timer', AppTimer);

//Report

import AppReport from '@components/report/AppReport'

Vue.component('app-report', AppReport);

//Meet

import MeetRoom from '@components/meet/MeetRoom'
Vue.component('meet-room', MeetRoom);

//Visor

import VisorAudio  from '@components/visor/VisorAudio'
import VisorVideo  from '@components/visor/VisorVideo'
import VisorEnlace from '@components/visor/VisorEnlace'
import VisorLibro  from '@components/visor/VisorLibro'
import VisorPdf    from '@components/visor/VisorPdf'

import VisorGoogle from '@components/visor/VisorGoogleMeet'

Vue.component('visor-audio' , VisorAudio);
Vue.component('visor-video' , VisorVideo);
Vue.component('visor-enlace', VisorEnlace);
Vue.component('visor-libro' , VisorLibro);
Vue.component('visor-pdf'   , VisorPdf);

Vue.component('visor-google-meet'   , VisorGoogle);

//Bot
import AppBotman  from '@components/botman/AppBotman'
Vue.component('app-botman'   , AppBotman);