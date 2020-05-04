<template>

    <!--menu-->
   <v-list>
        <v-list-group
            v-for="(paths,menu) in menus"
            :key="menu"
            ripple
            active-class="menu-active"
            prepend-icon="more_vert"
        >
            <template v-slot:activator>
                <v-list-item-content>
                    <v-list-item-title>{{ capitalize(menu) }}</v-list-item-title>
                </v-list-item-content>
            </template>

                <v-list-item
                    v-for="(path, submenu) in paths"
                    :key="submenu"
                    link
                    dense
                >
                    <v-list-item-icon>
                        <v-icon>navigate_next</v-icon>
                    </v-list-item-icon>
                    
                    <v-list-item-title 
                        v-text="actionName(path)"
                        @click="$router.push(path)"
                    ></v-list-item-title>
 
                </v-list-item>

        </v-list-group>
    </v-list>

</template>

<script>

import AppFormat  from '~/mixins/AppFormat'
import AppMessage from '~/mixins/AppMessage'

export default {
    mixins:[ AppFormat, AppMessage ],
    props:
    {
        items:{
            type: Array,
        },
    },
    data()
    {
        return{
            url : 'api/ldap/',
            menus : {},
        }
    },
    created ()
    {
            let url = this.url + this.$store.getters.username

            axios.get(url).then( response => 
            {
                if(response.status==200)
                {
                    this.menus=response.data
                }
            })
            .catch(error => 
            {
                this.showError(error)
            })
            
        },  
        methods:
        {
            actionName(value)
            {
                let elements = value.split('/')
                return this.capitalize(elements[elements.length-1])
            },
        },
}
</script>

<style scoped>
    .menu-active{
        color:#f44336 !important;
        caret-color: #f44336 !important;
    }
    .v-list-item--link::before{
        background-color: rgb(134, 133, 133) !important;
    }
    .menu-active.v-list-item__content{
        color:#f44336 !important;
        caret-color: #f44336 !important;
    }
</style>
