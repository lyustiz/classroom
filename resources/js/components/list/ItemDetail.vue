<template>

    <v-menu bottom left open-on-hover open-on-focus content-class="rounded-xl">
            
        <template v-slot:activator="{ on }">
            <v-btn text fab v-on="on" depressed small>
                <v-icon :color="color">{{icon}}</v-icon>
            </v-btn>
        </template>

        <v-list dense nav>
            <v-list-item dense v-for="(item, i) in items" :key="i" tile>
                <v-list-item-title>
                    <v-icon :color="color" class="mr-3">{{icon}}</v-icon>
                    <span class="my-2">{{ (itemText) ? item[itemText] : item }}</span>
                </v-list-item-title>
            </v-list-item>
        </v-list>
    </v-menu>

</template>

<script>
export default {
props:
    {
        icon: {
            type:     String,
            default:  ''
        },

        color: {
            type:     String,
            default:  'indigo'
        },

        items: {
            type:     Array,
            default:  () => []
        },

        itemText: {
            type:     String,
            default:  null

        },
    },
    methods:
    {
        insItem()
        {
            this.$emit('insItem')
        }
    }

}
</script>

<style>

</style>