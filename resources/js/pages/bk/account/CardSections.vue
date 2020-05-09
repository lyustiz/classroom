<template>
    <v-expand-transition>

        <v-card :dark="setDark" :color="setColor" :min-height="cardHeight">
            
            <v-card-title :class="color" >
                
                <template v-if="!expand">
                    <v-icon dark @click="$emit('expand')">mdi-unfold-more-vertical</v-icon>
                </template>
                <template v-else>
                    <v-icon dark @click="$emit('minimize')">mdi-close</v-icon>
                    <v-icon dark class="mx-2">{{icon}}</v-icon> 
                    <div class="white--text">{{ title }}:</div>
                </template>

                <v-spacer></v-spacer>

                <v-menu bottom left>
                    <template v-slot:activator="{ on }">
                    <v-btn dark icon v-on="on">
                        <v-icon>mdi-dots-vertical</v-icon>
                    </v-btn>
                    </template>
                    <v-list dense nav>
                    <v-list-item
                        v-for="(item, i) in menuItems"
                        :key="i"
                        tile
                        @click="$emit('onMenu', item.action)"
                    >
                        <v-list-item-action>
                            <v-btn class="grey lighten-4" icon >
                                <v-icon :color="setColor">{{item.icon}}</v-icon>
                            </v-btn>
                        </v-list-item-action>

                        <v-list-item-title>
                            {{ item.title }}
                        </v-list-item-title>
                        
                    </v-list-item>
                    </v-list>
                </v-menu>

            </v-card-title>
        
            <div v-if="!expand" @click="$emit('expand')"  ripple class="description-card d-flex flex-no-wrap justify-space-between">
                
                <div>
                    <v-card-title>{{ title }}</v-card-title>
                    <v-card-subtitle>{{ subtitle }}</v-card-subtitle>
                </div>

                <v-avatar class="ma-3"  size="90"  >
                    <v-icon size="70" dark>{{icon}}</v-icon>
                </v-avatar>

            </div>

            <div v-else>
                <component  :is="component" :color="color"></component>
            </div>

        </v-card>
    </v-expand-transition>

</template>

<script>

import Accout from './Account';
import Commerce from './Commerce';
import Images from './Images';
import WebPage from './WebPage';

export default {

    components: {
       'account' : Accout,
       'commerce': Commerce,
       'images'  : Images,
       'webpage'  : WebPage
    },
    props:
    {
        visible:{
            type:       Boolean,
            default:    true
        },
        expand:{
            type:       Boolean,
            default:    false
        },
        color:{
            type:       String,
            default:    'info'
        },
        title:{
            type:       String,
            default:    ''
        },
        subtitle:{
            type:       String,
            default:    ''
        },
        icon:{
            type:       String,
            default:    'msi-'
        },
        menuItems:{
            type:       Array,
            default:    () => []
        },
        component:{
            type:       String,
            default:    ''
        },
        
    },
    computed: {
        cardHeight()
        {
            return  (this.expand) ? 400 : 180;
        },
        setColor()
        {
            return (this.expand) ?  'white' : this.color;
        },
        setDark()
        {
            return !this.expand
        }
    },
    data()
    {
        return {
            dark: true,
        }
    }
}
</script>

<style>
.description-card{
    cursor: pointer;
}
</style>