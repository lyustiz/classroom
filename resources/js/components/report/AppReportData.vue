<template>

    <v-row no-gutters>
            
        <v-col cols="12">
            <v-data-table
                :headers="headers"
                :items  ="items"
                :search ="search"
                item-key="id"
                sort-by=""
                dense
            >
                <template v-slot:item="{ item }">
                    <tr>
                        <td v-for="(valor, campo) in item" :key="campo" class="text-xs-left">
                            {{ formatValue(valor, campo) }}   
                        </td>
                    </tr>
                </template>
            </v-data-table>
        </v-col>
            
    </v-row>

</template>

<script>

import format from '@mixins/AppFormat'

export default {

    mixins: [ format ],

    props: 
    {
        headers: {
            type: Array,
            default: () => {}
        },

        items: {
            type: Array,
            default: () => {}
        },

        search: {
            type: String,
            default: null
        }
    },
    
    methods:
    {
        formatValue(value, campo)
        {
            switch (campo.substr(0,2)) 
            {
                case 'fe':
                    return this.formatDate(value);
                    break;

                case 'mo':
                    return this.formatNumber(value);
                    break;
            
                default:
                    return value;
                    break;
            }
        }
    }

}
</script>