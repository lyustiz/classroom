<template>
    <v-layout row justify-center>
        
        <v-form v-model="valid" :lazy-validation="true" ref="form">

            <app-form  :action="action" :loading="loading">
                
                <template slot="title">Registro de nuevo Banco</template>
                
                <template slot="fields">

                    <v-flex xs6 sm6>
                        <v-text-field 
                            label="Nombre del Banco*"
                            v-model="form.nb_banco"
                            :rules="rules.required"
                            hint="Nombre de Banco">
                        </v-text-field>
                    </v-flex>
                    
                    <v-flex xs6 sm6>
                        <v-text-field 
                            label="Nombre Comercial del Banco*"
                            v-model="form.nb_comercial"
                            :rules="rules.required"
                            hint="Nombre Comercial de Banco">
                        </v-text-field>
                    </v-flex>

                    <v-flex xs6 sm6>
                        <v-text-field 
                            label="Código del Banco*"
                            v-model="form.co_banco"
                            :rules="rules.required"
                            hint="Código de Banco">
                        </v-text-field>
                    </v-flex>

                    <v-flex xs6 sm6>
                        <v-text-field 
                            label="Siglas del Banco*"
                            v-model="form.tx_siglas"
                            :rules="rules.required"
                            hint="Siglas de Banco">
                        </v-text-field>
                    </v-flex>

                    <v-flex xs12 sm6 d-flex>
                        <v-select
                            label="Tipo de Banco*"
                            v-model="form.id_tipo_banco" 
                            :rules="rules.required"
                            :items="selects.tipo_banco.items"
                            item-value="id_tipo_banco"
                            item-text="nb_tipo_banco"
                        ></v-select>
                    </v-flex>

                    <v-flex xs6 sm6>
                        <v-text-field 
                            label="Grupo del Banco*"
                            v-model="form.tx_grupo"
                            :rules="rules.required"
                            hint="Grupo del Banco">
                        </v-text-field>
                    </v-flex>
                    
                </template>

                <template slot="buttons">
                    <form-buttons
                        @store ="store()"
                        @update="update()"
                        @clear ="reset()"
                        @cancel ="cancel()"
                        :action="action"
                        :valid="valid"
                    ></form-buttons>
                </template>

            </app-form>

        </v-form>
    </v-layout>
</template>

<script>
    import Appform from "~/mixins/Appform" 
    export default {
        mixins:[Appform],
        data(){
            return {
                resource: 'banco',
                form:{
                    nb_banco:       null,
                    nb_comercial:   null,
                    co_banco:       null,
                    tx_siglas:      null,
                    id_tipo_banco:  null,
                    tx_grupo:       null,
                },
                selects:
                {   
                    tipo_banco: {group:'/grupo/dicom',items:[]},  
                },
            }
        },
    }
</script>

<style>

</style>
