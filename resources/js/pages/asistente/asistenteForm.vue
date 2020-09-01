<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" flat>

        <v-card-text>

        <v-row>

        <v-col cols="12" md="6">
            <v-select
                :items="selects.menu"
                item-text="nb_menu"
                item-value="id"
                v-model="form.id_menu"
                :rules="[rules.select]"
                label="Menu"
                :loading="loading"
                dense
                @change="defaultData($event)"
                ref='menus'
            ></v-select>
        </v-col>

                 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nb_asistente"
                label="Asistente"
                placeholder="Titulo Asistente"
                dense
            ></v-text-field>
        </v-col>
                        
          
        <v-col cols="12" md="4">
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
                  
        <v-col cols="12" md="4">
            <v-text-field
                :rules="[rules.required]"
                v-model="form.nu_orden"
                label="Orden"
                placeholder="Indique Orden"
                dense
                type="number"
            ></v-text-field>
        </v-col>

        <v-col cols="12" md="4">
            <v-select
            :items="grupoAsistente"
            item-text="nb_grupo"
            item-value="nb_grupo"
            v-model="form.tx_grupo"
            :rules="[rules.select]"
            label="Indique Grupo"
            :loading="loading"
            dense
            ></v-select>
        </v-col>

        <v-col cols="12">
            <v-textarea
                :rules="[rules.required, rules.max(100)]"
                v-model="form.tx_descripcion"
                label="Descripcion"
                placeholder="Indique Descripcion"
                dense
                filled
                rows="2"
            ></v-textarea>
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

        <pre vv-if="$App.debug">{{ $data }}</pre>

    </v-card>
    
    </v-form>

</template>

<script>

import Appform from '@mixins/Appform';

export default {
    mixins: [Appform],
    data() {
        return {
            resource: 'asistente',
            form:
            {
                id: 	          null,
				nb_asistente: 	  null,
				id_menu: 	      null,
				tx_descripcion:   null,
				tx_color: 	      null,
				nu_orden: 	      null,
				tx_grupo: 	      null,
				tx_observaciones: null,
				id_status: 	      null,
				id_usuario: 	  null,
            },
            selects:
            {
                menu: 	 ['/combo'],
            },
        }
    },

    methods:
    {
        defaultData(menuId)
        {
            let menu = this.selects.menu.filter((menu) => menu.id == menuId )
            console.log(menu)
            this.form.nb_asistente = menu.nb_menu
            this.form.tx_color = menu.tx_color
        }
    }
}
</script>

<style>
</style>