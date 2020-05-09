<template>

 <div>

        <v-form ref="form" v-model="valido" lazy-validation>

            <v-layout wrap>

                 <v-flex xs1>
                    <v-btn small color="success" @click="listsLoader()">schema</v-btn>
                </v-flex>
                

                <v-flex xs1*>
                    <v-select
                        label="Schema"
                        v-model="form.schema"
                        :items="lists.schemas"
                        :rules="[rules.required]"
                        @change="getTables()"
                    ></v-select>
                </v-flex>

                <v-flex xs1>
                    <v-btn small color="success" @click="getTables()">table</v-btn>
                </v-flex>

                 

                <v-flex xs12>

                <v-list dense>
                    <v-list-item dense v-for="(table, nbTable) in tables"  :key="nbTable" >
                                <v-checkbox  class="ma-0" :label="nbTable" :value="table" v-model="form.tables" multiple> </v-checkbox>
                    </v-list-item>
                </v-list>
                </v-flex>
                <v-flex xs12>

               <!--  <v-list dense>
                    <v-list-group
                        v-for="(table, nbTable) in tables" :key="nbTable"
                        :v-model="false"
                        prepend-icon="grid_on"
                        dense
                    >

                        <template v-slot:activator>                        
                            <v-list-item-content>
                                    <v-checkbox  class="ma-0" :label="nbTable" :value="table" v-model="form.tables" multiple> </v-checkbox>
                            </v-list-item-content>
                        </template>

                        <v-list-item dense v-for="(column, nbColumn) in table.columns"  :key="nbColumn" >

                            <v-list-item-content>
                                <v-list-item-title>
                                    <v-row no-gutters>
                                     <v-col cols="3"><v-chip class="mx-2" label small>  {{nbColumn}} </v-chip> </v-col>
                                     <v-col cols="2"><v-chip small><v-icon left color="info">looks_one</v-icon>{{ column.type }}</v-chip> </v-col>
                                     <v-col cols="2"><v-chip small><v-icon left color="info">link_off</v-icon>{{ !column.notnull }}</v-chip> </v-col>
                                     <v-col cols="2"><v-chip small><v-icon left color="info">straighten</v-icon>{{ column.length }}</v-chip> </v-col>
                                     <v-col cols="1"><v-chip small><v-icon left color="info">settings_ethernet</v-icon>{{ column.precision }}</v-chip> </v-col>
                                     <v-col cols="1"><v-chip small><v-icon left color="info">speaker_notes</v-icon>{{ column.comment }}</v-chip> </v-col>
                                     <v-col cols="1"><v-chip small v-if="table.primaryKey == nbColumn"><v-icon left color="red">vpn_key</v-icon></v-chip> </v-col>
                                </v-row>
                                </v-list-item-title>
                            </v-list-item-content>

                        </v-list-item>

                    </v-list-group>
                </v-list> -->
                </v-flex>

            </v-layout>

     </v-form>

        <form-buttons
            @store ="generate()"
            @clear ="clear()"
            @cancel="cancel()"
            :btnAccion="false"
            :valid="true"
        ></form-buttons>

    </div>


</template>

<script>

import listHelper from '~/mixins/Applist';
import formHelper from '~/mixins/Appform';
import AppRules from '~/mixins/AppRules';
 export default {
  mixins: [formHelper],
    created()
    {
 this.listsLoader()
    },

    data () {
        return {
            tabla: 'pago',
            form:{
                schema:  '',
                tables:  '',  
            },
            lists:{
                schemas: [],
            },
            valido: true,
            tables: [],
        }
    },
    methods: { 
        listsLoader()
        {
            axios.get('api/' + 'crud/' + 'schemas')
                    .then(response => {
                        this.lists.schemas = response.data.schemas;
                    })
                    .catch(error => {
                        this.showError(error);
                    })
        },

        getTables()
        {
            axios.post('api/' + 'crud/' + 'tables', this.form)
            .then(response => {
                this.tables = response.data;
                this.IsLoading = false
            })
            .catch(error => {
                this.showError(error)
                this.IsLoading = false
            })
        },
        generate()
        {
            if (this.$refs.form.validate()) 
            {
                axios.post('api/' + 'crud/' + 'generate',this.form)
                .then(respuesta => {

                    console.log(respuesta.data);

                    this.IsLoading = false
                })
                .catch(error => {
                    this.showError(error)
                    this.IsLoading = false
                })
            }
        }
    },
    
 }
</script>
<style scope>

</style>
