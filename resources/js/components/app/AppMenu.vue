<template>

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

</template>

<script>

import AppMessage from '~/mixins/AppMessage'

export default {
    mixins:[ AppMessage ],
    data()
    {
        return{
            menus: []
            ,
        }
    },
    created ()
    {
            let url = this.url + this.$store.getters.username
     
            this.menus = this.$router.options.routes.filter((menu) =>  !['welcome', 'notfound'].includes(menu.name) )
           
        },  
        methods:
        {
            navegateTo(route)
            {
               this.$router.push(route).catch(err => {})
            }

        },
}
</script>

<style scoped>
    .menu-active{
        color:#3f51b5 !important;
        caret-color: #3f51b5 !important;
    }
    .v-list-item--link::before{
        background-color: rgb(134, 133, 133) !important;
    }
    .menu-active.v-list-item__content{
        color:#3f51b5 !important;
        caret-color: #3f51b5 !important;
    }
</style>
