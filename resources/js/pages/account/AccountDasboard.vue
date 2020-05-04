<template>

  <div id="full-container" class="cyan px-3">
  <v-container fluid>
      
  <v-row >
      
      <v-col>
        <v-btn text dark>
            Administracion de la Cuenta
        </v-btn>
      </v-col>
      
  </v-row>

  <v-divider dark></v-divider>

  <v-row>
      
      <template v-for="(card, i) in cardSections" >
     
        <v-col :md="card.cols" :key="i" v-if="card.visible" >

            <card-sections 
                :visible="card.visible"
                :expand="card.expand"
                :color="card.color"
                :title="card.title"
                :subtitle="card.subtitle"
                :icon="card.icon"
                :menuItems="card.menuItems"
                :component="card.component"
                @expand="expand(card.id)"
                @minimize="minimize(card.id)"
                @onMenu="onMenu($event)"
            ></card-sections>

        </v-col>

      </template>

    </v-row>

    <v-row>

        <v-col cols="12" md="6" v-if="!expander">
            <status-card></status-card>
        </v-col>

    </v-row>

</v-container>
</div>

</template>

<script>

import { mapActions } from 'vuex';
import CardSection from './CardSections';
import StatusCard  from './StatusCard';

export default {
    components: 
    {
        'card-sections': CardSection,
        'status-card': StatusCard
    },
    created()
    {

        if(!this.$store.getters['getAuth'])
        {
            this.$router.push('login').catch(err => {})
        }

        let user = this.$store.getters['getUser']

        this.cardSections = this.sectionsByUser(user.id_tipo_usuario)

    },

    data()
    {
        return {

            cardCols: 3,
            cardHeight: 180,
            display: 'd-block',
            expander: false,
            cardSections: []
        }
    },
    methods: {

        ...mapActions(['apiComercioUsuario']),

        expand(cardId)
        {
            
            this.cardSections.forEach((card, index) => {
                
                if(card.id == cardId)
                {
                    this.cardSections[index].expand = true;
                    this.cardSections[index].cols = 12;
                }
                else
                {
                    this.cardSections[index].visible = false;
                }

            }, this);

           this.expander = true


        },

        minimize(cardId)
        {

            this.cardSections.forEach((card, index) => {
                
                if(card.id == cardId)
                {
                    this.cardSections[index].expand = false;
                    this.cardSections[index].cols = 3;
                }
                else
                {
                    this.cardSections[index].visible = true;
                }

            }, this);
            this.expander = false
        },

        sectionsByUser(tipoUsuario)
        {
            
            if(tipoUsuario == 2)
            {
                return [
                    {
                        id: 1,
                        color: 'amber',
                        title: 'Cuenta',
                        subtitle: 'Configurar',
                        icon: 'mdi-account-box',
                        visible: true,
                        expand: false,
                        menuItems: [
                            {title: 'Minimizar', icon: 'mdi-close-circle', action: { name: 'minimize', data: 1 }},
                            {title: 'Ampliar', icon: 'mdi-unfold-more-vertical', action: { name: 'expand', data: 1 }},
                        ],
                        component: 'account', 
                        cols: 3
                    }
                ]
            }

            if(tipoUsuario == 3)
            {
                return  [
                    {
                        id: 1,
                        color: 'amber',
                        title: 'Cuenta',
                        subtitle: 'Configurar',
                        icon: 'mdi-account-box',
                        visible: true,
                        expand: false,
                        menuItems:  [
                            {title: 'Minimizar', icon: 'mdi-close-circle', action: { name: 'minimize', data: 1 }},
                            {title: 'Ampliar', icon: 'mdi-unfold-more-vertical', action: { name: 'expand', data: 1 }},
                        ],
                        component: 'account', 
                        cols: 3
                    },
                    {
                        id: 2,
                        color: 'success',
                        title: 'Comercio',
                        subtitle: 'Configurar',
                        icon: 'mdi-storefront',
                        visible: true,
                        expand: false,
                        menuItems:  [
                            {title: 'Minimizar', icon: 'mdi-close-circle', action: { name: 'minimize', data: 2 }},
                            {title: 'Ampliar', icon: 'mdi-unfold-more-vertical', action: { name: 'expand', data: 2 }},
                        ],
                        component: 'commerce', 
                        cols: 3
                    }
                ]
            }

            if(tipoUsuario == 1)
            {
                return  [
                    {
                    id: 1,
                    color: 'amber',
                    title: 'Cuenta',
                    subtitle: 'Configurar',
                    icon: 'mdi-account-box',
                    visible: true,
                    expand: false,
                    menuItems:  [
                            {title: 'Minimizar', icon: 'mdi-close-circle', action: { name: 'minimize', data: 1 }},
                            {title: 'Ampliar', icon: 'mdi-unfold-more-vertical', action: { name: 'expand', data: 1 }},
                        ],
                    component: 'account', 
                    cols: 3
                },
                {
                    id: 2,
                    color: 'success',
                    title: 'Comercio',
                    subtitle: 'Configurar',
                    icon: 'mdi-storefront',
                    visible: true,
                    expand: false,
                    menuItems:  [
                            {title: 'Minimizar', icon: 'mdi-close-circle', action: { name: 'minimize', data: 2 }},
                            {title: 'Ampliar', icon: 'mdi-unfold-more-vertical', action: { name: 'expand', data: 2 }},
                        ],
                    component: 'commerce', 
                    cols: 3
                },
                {
                    id: 3,
                    color: 'red',
                    title: 'Imagenes',
                    subtitle: 'Administrar',
                    icon: 'mdi-image',
                    visible: true,
                    expand: false,
                    menuItems:  [
                            {title: 'Minimizar', icon: 'mdi-close-circle', action: { name: 'minimize', data: 3 }},
                            {title: 'Ampliar', icon: 'mdi-unfold-more-vertical', action: { name: 'expand', data: 3 }},
                        ],
                    component: 'images', 
                    cols: 3
                },
                {
                    id: 4,
                    color: 'purple',
                    title: 'Pagina Web',
                    subtitle: 'Configurar',
                    icon: 'mdi-tablet-dashboard',
                    visible: true,
                    expand: false,
                    menuItems:  [
                            {title: 'Minimizar', icon: 'mdi-close-circle', action: { name: 'minimize', data: 4 }},
                            {title: 'Ampliar', icon: 'mdi-unfold-more-vertical', action: { name: 'expand', data: 4 }},
                        ],
                    component: 'webpage', 
                    cols: 3
                },
                ]
            }
        },

        onMenu(action)
        {
            switch (action.name) {
                case 'minimize':
                    this.minimize(action.data)
                    break;
                case 'expand':
                    this.expand(action.data)
                    break;
            
                default:
                    break;
            }

            
        }
    }
}
</script>

<style>
#full-container{
    min-height: 200%;
    background-color: blue;
    background-attachment: fixed;
    background-size: 100% 100%; 
}
</style>


