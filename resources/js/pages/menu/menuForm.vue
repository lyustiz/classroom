<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_menu"
                label="Menu"
                placeholder="Indique Menu"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
                :items="selects.modulo"
                item-text="nb_modulo"
                item-value="id"
                v-model="form.id_modulo"
                :rules="[rules.select]"
                label="Modulo"
                :loading="loading"
                dense
            ></v-select>
        </v-col>
          
        <v-col cols="12" md="6">
            <v-text-field
                prepend-icon="mdi-routes"
                :rules="[rules.required]"
                v-model="form.tx_ruta"
                label="Ruta"
                placeholder="Indique Ruta"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.tx_path"
                label="Path"
                placeholder="Indique Path"
                dense
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :prepend-icon="form.tx_icono"
                :rules="[rules.required]"
                v-model="form.tx_icono"
                label="Icono"
                placeholder="Indique Icono"
                dense
                append-outer-icon="mdi-shape-outline"
                @click:append-outer="$refs.icons.click()"
            ></v-text-field>
            <a  class="d-none" ref="icons" rel="noreferrer noopener" href="/icons/"  target="_blank"></a>
        </v-col>
                  
         <v-col cols="12" md="6">
            <v-input
                prepend-icon="mdi-format-color-fill"
                :value="form.tx_color">
                    <div class="mx-2">Color</div>

                    <v-menu offset-y max-width="200">
                        <template v-slot:activator="{ on }">
                            <v-chip slot="activator" v-on="on" small label :color="form.tx_color"></v-chip>
                        </template>
                        <span>
                            <v-card>
                            <v-btn 
                                v-for="color in colors" :key="color"
                                :color="color" 
                                dark
                                x-small
                                fab 
                                class="ma-1"
                                @click="form.tx_color = color">
                            </v-btn>
                            </v-card>                        
                        </span>
                    </v-menu>
            </v-input>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                prepend-icon="mdi-puzzle"
                :rules="[rules.required]"
                v-model="form.tx_target"
                label="Target"
                placeholder="Indique Componente"
                dense
            ></v-text-field>
        </v-col>
                 
            <v-checkbox
                   :rules="[rules.check]"
                  v-model="form.bo_visible"
                  label="Visible"
                  :true-value="1"
                  :false-value="0"
                  :indeterminate="(form.bo_visible== null)"
                  dense
            ></v-checkbox>
 
        <v-col cols="12" md="6">
            <v-text-field
                prepend-icon="mdi-order-numeric-ascending"
                :rules="[rules.required]"
                v-model="form.nu_orden"
                label="Orden"
                placeholder="Indique Orden"
                dense
                type="number"
            ></v-text-field>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(100)]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
                dense
            ></v-text-field>
        </v-col>
                                  

        </v-row>

        </v-card-text>

        <v-card-actions>
            <v-spacer></v-spacer>
            <form-buttons
                @update="update()"
                @store="store()"
                @clear="clear()"
                @cancel="cancel()"
                :action="action"
                :valid="valid"
                :loading="loading"
            ></form-buttons>
        </v-card-actions>

        <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';

export default {
    mixins: [Appform],
    data() {
        return {
            resource: 'menu',
            form:
            {
                id: 	          null,
				nb_menu: 	      null,
				id_modulo: 	      null,
				tx_ruta: 	      null,
				tx_path: 	      null,
				tx_icono: 	      null,
				tx_color: 	      null,
				tx_target: 	      null,
				bo_visible: 	  null,
				nu_orden: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                modulo: 	 [],
            },
        }
    },

    methods:
    {

    }
}
</script>

<style>
</style>