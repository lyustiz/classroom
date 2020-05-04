<template>

    <v-form v-model="valid" ref="form" >
    <v-card :loading="loading" class="ma-1">
        <v-card-title
            class="headline cyan darken-3 white--text"
            primary-title
        >
           <div> Comentario de <span class="ml-2 font-weight-bold">{{ userName }} </span> </div> <v-spacer></v-spacer>
           <v-btn icon x-small="" color="white" @click="cancel()">
               <v-icon>mdi-close-circle</v-icon>
           </v-btn>
        </v-card-title>

        <v-card-text class="py-3">
            <p class="caption">Las reseñas son públicas y se pueden editar.</p>
            

                <v-flex xs12 d-flex>
                    <v-textarea
                        color="cyan darken-3"
                        prepend-inner-icon="mdi-comment-edit"
                        placeholder=" Cuenta a los demás qué opinas de este Comercio. ¿Lo recomendarías? ¿Por qué?"
                        label="Opinion/Valoracion"
                        hint="maximo 200 caracteres"
                        v-model="form.tx_valoracion"
                        :rules="[rules.required]"
                        dense
                        outlined
                        filled
                        rows="4"
                        counter="200"
                        auto-grow
                        autofocus
                    ></v-textarea>
                </v-flex>
                <v-flex xs12 d-flex>
                    <v-rating
                        v-model="form.nu_valoracion"
                        color="amber"
                        background-color="amber"
                        hover
                        ripple
                        size="24"
                    ></v-rating>
                    <div class="py-3 px-1" >
                         <v-input readonly  :rules="[rules.required]" :value="textValue(form.nu_valoracion)">
                            {{textValue(form.nu_valoracion)}}
                         </v-input>
                    </div>
                 </v-flex>
            
        </v-card-text>

        <v-card-actions>

            <v-spacer></v-spacer>
            <v-btn small  fab color="error" @click="cancel()" :loading="loading"><v-icon>mdi-restore</v-icon></v-btn>
            <v-btn small dark fab color="success" @click="setData()" :loading="loading"><v-icon>mdi-content-save-edit</v-icon></v-btn>
        </v-card-actions>

        <v-divider></v-divider>

        <v-card-text>


            <v-card  >
                <v-card-title class="caption grey lighten-3">
                    Comentarios de otros usuarios
                </v-card-title>
            <v-list three-line dense >
                <v-list-item v-for="(valoration, i) in valorations" :key="i">
                
                <v-list-item-avatar>
                    <v-icon dark class="grey lighten-1 white--text">mdi-account</v-icon>
                </v-list-item-avatar>
                
                <v-list-item-content>
                    <v-list-item-title>
                        {{valoration.nb_usuario}}
                        <div class="caption">Ultima Actualizacion: {{ format(valoration.created_at) || format(valoration.updated_at)}}</div>
                    </v-list-item-title>
                    <v-list-item-subtitle>

                        <v-rating
                            color="amber"
                            :value="valoration.nu_valoracion"
                            background-color="amber"
                            dense
                            hover
                            ripple
                            readonly
                            size="16"
                        ></v-rating>
                    </v-list-item-subtitle>
                    <v-list-item-subtitle>{{valoration.tx_valoracion}}</v-list-item-subtitle>
                </v-list-item-content>

                </v-list-item>
            </v-list>
            </v-card>

        </v-card-text>
    </v-card>
    
 
    </v-form>

</template>

<script>
import AppForm from '@mixins/AppForm'

export default {

    mixins: [ AppForm ],
    props:
    {
        id_comercio: {
            type:       Number,
            default:    null
        },
    },

    created()
    {
        this.fetch()
    },

    computed:
    {
        getUserid()
        {
            return this.$store.getters['getUserid']
        },

        userName()
        {
            return this.$store.getters['getUsername']
        }
    },

    data()
    {
        return {
            resource: 'valoracion',
            form: {
                id:            '',
                id_comercio:   '',
                tx_valoracion: '',
                nu_valoracion:  0,
                id_usuario:    '',
            },
            valorations: []
        }
    },
    methods:
    {
        
        fetch()
        {
            axios.get(`/api/v1/${this.resource}/comercio/${this.id_comercio}/${this.getUserid}`)
			.then( response =>
			{
                if(response.data.valoracionUsuario) 
                {
                    this.mapData(response.data.valoracionUsuario)
                }

                if(response.data.valoracionComercio)
                {
                    this.valorations = response.data.valoracionComercio
                }
			})
            .catch( error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false
            }); 
        },
        
        setData()
        {
            if (!this.$refs.form.validate())  return 
            this.loading = true;
            this.form.id_usuario = this.getUserid;

            console.log(this.form.id_usuario, this.getUserid)

            if(this.form.id)
            {
                this.update()

            }else{

                this.form.id_comercio = this.id_comercio
                this.store()
            }
        },

        store()
        {
            axios.post('/api/v1/' + this.resource, this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
			})
            .catch( error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false
            }); 
        },
        
        update()
        {
            axios.put('/api/v1/' + this.resource + '/' + this.form.id, this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
			})
            .catch( error =>
            {
                this.showError(error);
            })
            .finally( () =>
            {
                this.loading = false
            }); 
        },
        
        textValue(value)
        {
            switch (value) {
                case 1:
                    return 'No lo recomiendo'
                    break;
                case 2:
                    return 'Presenta problemas'
                    break;
                case 3:
                    return 'Servicio Regular '
                    break;
                case 4:
                    return 'Buen Servicio'
                    break;
                case 5:
                    return 'Excelente Servicio'
                    break;
                default:
                    return ''
                    break;
            }
        },

        format( date)
        {
            if(date != '')
            {
                return date.substr(0, 10)
            }
            return '';
        },

        cancel()
        {
            this.clear()
            this.$emit('close');
        }
    }
}
</script>

<style>

</style>
