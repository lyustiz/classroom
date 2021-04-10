<template>
<div>

    <!--profile-->
    <app-profile></app-profile>

    <!--menu-->
   <v-list nav>
        <v-list-group
            v-for="(menu, idx) in menus"
            :key="idx"
            ripple
            active-class="menu-active"
            :prepend-icon="menu.icon"
            @click="navegateTo(menu.path)"
        >
            <template v-slot:activator>
                <v-list-item-content>
                    <v-list-item-title>{{ menu.label }}</v-list-item-title>
                    
                </v-list-item-content>
            </template>

                <v-list-item
                    v-for="(submenu, idx) in menu.children"
                    :key="idx"
                    link
                    dense
                    @click="navegateTo({name: submenu.name})"
                >
                    <v-list-item-icon>
                        <v-icon>{{submenu.icon}}</v-icon>
                    </v-list-item-icon>
                    
                    <v-list-item-title 
                        v-text="submenu.label"
                        
                    ></v-list-item-title>
 
                </v-list-item>

        </v-list-group>
    </v-list>
</div>
</template>

<script>

import AppProfile from '@components/app/AppProfile'

export default {

    components: 
    {
        'app-profile': AppProfile
    },

    data()
    {
        return{
            menus: []
            ,
        }
    },
    created ()
    {
            this.setMenu()
    },  
    methods:
    {
        setMenu()
        {
            this.menus = this.$router.options.routes.filter((menu) =>  {

                if(this.profile) {
                    return  (menu.visible === true) && ( (menu.profile == this.profile.nb_perfil)  ||  (menu.profile == '*') )
                }

                return false

            })

            for (const menus of this.menus) {
                if(menus.children)
                {
                    menus.children = menus.children.filter(menu =>  menu.visible )
                }
            }
        }
    },
    watch:
    {
        profile()
        {
            this.setMenu()
        }

    },
    computed: 
    {
        profile()
        {
            return this.$store.getters['getProfile'] 
        }
    }
}
</script>

<style scoped>
    .menu-active{
        color:#ff9800 !important;
        caret-color: #ff9800 !important;
    }
    .v-list-item--link::before{
        background-color: #4caf50 !important;
    }
    .menu-active.v-list-item__content{
        color:#ff9800 !important;
        caret-color: #ff9800 !important;
    }
</style>
