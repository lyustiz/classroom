<template>

    <v-form ref="form" v-model="valid" lazy-validation>

    <v-card :loading="loading" >

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
            ></v-select>
        </v-col>
                  
        <v-col cols="12" md="6">
            <v-select
            :items="selects.perfil"
            item-text="nb_perfil"
            item-value="id"
            v-model="form.id_perfil"
            :rules="[rules.select]"
            label="Perfil"
            :loading="loading"
            dense
            ></v-select>
        </v-col>
         
            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_select"
                  label="Select"
                  dense
            ></v-checkbox>

            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_insert"
                  label="Insert"
                  dense
            ></v-checkbox>

            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_update"
                  label="Update"
                  dense
            ></v-checkbox>

            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_delete"
                  label="Delete"
                  dense
            ></v-checkbox>

            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_admin"
                  label="Admin"
                  dense
            ></v-checkbox>

            <v-checkbox
                  :rules="[rules.required]"
                  v-model="form.bo_default"
                  label="Default"
                  dense
            ></v-checkbox>
 
        <v-col cols="12" md="6">
            <v-text-field
                :rules="[rules.max(100)]"
                v-model="form.tx_observaciones"
                label="Observaciones"
                placeholder="Indique Observaciones"
                dense
            ></v-text-field>
        </v-col>
                          
        <v-col cols="12" md="6">
            <v-select
            :items="selects.status"
            item-text="nb_status"
            item-value="id"
            v-model="form.id_status"
            :rules="[rules.select]"
            label="Status"
            :loading="loading"
            dense
            ></v-select>
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
            resource: 'permiso',
            dates:
            {
                
            },
            pickers:
            {
                
            },
            form:
            {
                id: 	null,
				id_menu: 	null,
				id_perfil: 	null,
				bo_select: 	null,
				bo_insert: 	null,
				bo_update: 	null,
				bo_delete: 	null,
				bo_admin: 	null,
				bo_default: 	null,
				tx_observaciones: 	null,
				id_status: 	null,
				id_usuario: 	null,
            },
            selects:
            {
                menu: 	 [],
	 	 	 	perfil: 	 [],
	 	 	 	status: 	 [],
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