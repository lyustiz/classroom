<template>
    <v-form v-model="valid" ref="form" >
    <v-row no-gutters="">
        <v-col md="6" sm="12" xs="12">
            <v-card class="ml-auto" max-width="400" :loading="loading">
            <v-card-title >
                Informacion del Comercio
            </v-card-title>
            <v-card-text>

                <v-flex xs12 >
                    <v-text-field
                        color="cyan darken-3"
                        prepend-inner-icon="mdi-gavel"
                        label="Nit"
                        hint="NIT del Comercio Ej: 123123123-1"
                        :rules="rules.nit"
                        v-model="form.tx_nit"
                        dense
                        outlined
                        filled >
                    </v-text-field>
                </v-flex>

                <v-flex xs12 >
                    <v-text-field
                        color="cyan darken-3"
                        prepend-inner-icon="mdi-storefront-outline"
                        label="Nombre Fiscal"
                        type="text"
                        :rules="[rules.required, rules.maxlength(50)]"
                        v-model="form.nb_fiscal"
                        dense
                        outlined
                        filled >
                    </v-text-field>
                </v-flex>

                <v-flex xs12 >
                    <v-text-field
                        color="cyan darken-3"
                        prepend-inner-icon="mdi-storefront-outline"
                        label="Nombre Comercial"
                        type="text"
                        :rules="[rules.maxlength(50), rules.required]"
                        v-model="form.nb_comercio"
                        dense
                        outlined
                        filled >
                    </v-text-field>
                </v-flex>

                <v-flex xs12 d-flex>
                    <v-select
                        label="Tipo Comercio*"
                        prepend-inner-icon="mdi-storefront-outline"
                        :rules="[rules.select]"
                        v-model="form.id_tipo_comercio" 
                        :items="selects.tipoComercio"
                        item-value="id"
                        item-text="nb_tipo_comercio"
                        dense
                        outlined
                        filled
                    ></v-select>
                </v-flex>

                <v-flex xs12 d-flex>
                    <v-select
                        label="Categorias del Comercio*"
                        prepend-inner-icon="mdi-storefront-outline"
                        :rules="[rules.mutiple]"
                        v-model="form.categorias" 
                        :items="getCategorias"
                        item-value="id"
                        item-text="nb_categoria"
                        multiple
                        chips
                        dense
                        outlined
                        filled
                    ></v-select>
                </v-flex>

                <v-flex xs12 d-flex>
                    <v-select
                        prepend-inner-icon="credit_card"
                        label="Medios de Pago*"
                        v-model="form.id_tipo_pago" 
                        :rules="[rules.select]"
                        :items="selects.tipoPago"
                        item-value="id"
                        item-text="nb_tipo_pago"
                        chips
                        dense
                        outlined
                        filled
                    ></v-select>
                </v-flex>

                <v-flex xs12 d-flex>
                    <v-combobox
                        prepend-inner-icon="mdi-calendar-clock"
                        label="Horarios*"
                        hint="Seleccione o escriba los horarios de trabajo"
                        v-model="form.horarios" 
                        :rules="[rules.select]"
                        :items="selects.horarios"
                        multiple
                        chips
                        dense
                        outlined
                        filled
                    ></v-combobox>
                </v-flex>

                <v-flex xs12 d-flex>
                    <v-textarea
                        prepend-inner-icon="mdi-wallet-travel"
                        label="Actividad Comercial"
                        hint="Detalle la Actvidad Comercial de la Empresa"
                        v-model="form.tx_descripcion"
                        :items="selects.horarios"
                        :rules="[rules.maxlength(180)]"
                        dense
                        outlined
                        auto-grow
                        filled
                        rows="2"
                        counter="150"
                    ></v-textarea>
                </v-flex>
                
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn small dark fab color="amber" @click="cancel()" :loading="loading"> <v-icon>mdi-restore</v-icon></v-btn>
                    <v-btn small dark fab color="success" @click="update()" :loading="loading"> <v-icon>mdi-content-save-edit</v-icon></v-btn>
            </v-card-actions>
        </v-card>

        </v-col >


        <v-col cols="12" md="6" lg="6">

            <v-card class="mx-rigth pa-2" max-width="300">
            
                <v-img
                :src="fileSrc"
                lazy-src="images/store.png"
                aspect-ratio="1"
                class="grey lighten-2"
                max-width="300"
                max-height="200"
                >
                    <template  >
                        <v-row
                        class="fill-height"
                        align="center"
                        justify="center"
                        >
                        <v-file-input 
                            id="inputImage" 
                            color="red" 
                            accept="image/*" 
                            capture="camera" 
                            v-model="file" 
                            prepend-icon="mdi-image-search" 
                            class="col-1" 
                            ref="inputImage"
                        >
                            <template v-slot:selection="{  }">
                                <div></div>
                            </template>
                        </v-file-input>
                        </v-row>
                    </template>
                </v-img>

            </v-card>
        </v-col>
    
    </v-row>
    
    
    </v-form>
</template>

<script>

import AppForm from '@mixins/AppForm'

export default {
    
    mixins: [ AppForm ],

    created()
    {
        this.item = this.$store.getters['getComercio']
        this.mapForm()
        this.setRelations()
        this.setSrc()
        this.loading = false
    },

    computed: 
    {
        getComercio()
        {
            return this.$store.getters['getComercio']
        },
        
        getIduser()
        {
            return this.$store.getters['getUserid']
        },

        getCategorias()
        {
            return this.$store.getters['getCategorias']
        },

        fileSrc()
        {
           if(this.file) {

                if(this.validImage(this.file))
                {
                    this.form.tx_foto = this.file.name;
                    let src = (this.file.src) ? this.file.src : URL.createObjectURL(this.file);

                    if(!this.file.src)
                    {
                        this.fileToSrc()
                    }

                    return  src;
                }
            }

            this.form.tx_foto = '';
            this.form.tx_src  = '';
            return 'images/store.png';
        },
    },

    data(){
        return{
            resource: 'comercio', 
            form: {
                id:               null,
                nb_comercio:      null,
                nb_fiscal:        null,
                tx_nit:           null,
                tx_descripcion:   null,
                id_tipo_comercio: null,
                categorias:       null,
                id_tipo_pago:     null,
                horarios:         null,
                id_usuario:       null,
                tx_foto:          null
            },
            file: null,
            selects: {
                tipoComercio: [
                    { id: 1, nb_tipo_comercio: 'Sede Física'},
                    { id: 2, nb_tipo_comercio: 'Tienda Virtual (Solo Medios Digitales)'},
                    { id: 3, nb_tipo_comercio: 'Solo Servicio a Domicilio (No posee Sede Física)'}
                ],
                tipoPago: [
                    { id: 1, nb_tipo_pago: 'Visa'},
                    { id: 2, nb_tipo_pago: 'Mastercard'},
                    { id: 3, nb_tipo_pago: 'Efectivo'},
                    { id: 4, nb_tipo_pago: 'Debito'},
                    { id: 5, nb_tipo_pago: 'Criptomoneda'},
                    { id: 6, nb_tipo_pago: 'Paypal'}
                ],
                horarios: ['Lunes a viernes 7:00 am - 8:00 pm', ' Sabados 7:00 am - 8:00 pm' ]
            },
        }
    },
    methods:
    {

        update()
        {
            if (!this.$refs.form.validate())  return 

            this.loading = true;
            this.form.id_usuario = this.getIduser;
            
            axios.put(this.apiUrl    + this.resource + '/info', this.form)
			.then( response =>
			{
                this.showMessage(response.data.msj)
                this.item = this.form
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

        setRelations()
        {
            if(this.item)
            {
                let horarios = this.item.horario.map(item => item.nb_horario) 
                this.form.horarios    = horarios
                this.selects.horarios = horarios
                this.form.categorias  = this.item.comercio_categoria.map(item => item.id_categoria) 
            }
        },

        validImage(image)
        {
            let size = image.size / 1024  ; //kilobites
            let type = image.type.split('/');
            let imageType = ['jpeg', 'png', 'bmp'];

            const fileTypes = [
                "image/apng",
                "image/bmp",
                "image/gif",
                "image/jpeg",
                "image/pjpeg",
                "image/png",
                "image/svg+xml",
                "image/tiff",
                "image/webp",
                "image/x-icon"
                ];

            if(size > 0)
            {
                if(size > 2048)
                {
                    let msj = 'archivo debe ser menor de 2 MB. (Actual: '+ (size / 1024).toFixed(2) +' MB)';
                    this.showError(msj)
                    return false;
                }
            }

            if( (type[0] != 'image') || ( !imageType.includes(type[1]) ) )
            {
                let msj = 'solo se permiten imagenes con los formatos: ' + imageType;
                this.showError(msj)
                return false;
            }

           return true;
        },

        setSrc()
        {
            let fullSrc = '/storage/commerce/' + this.form.tx_foto
            
            if(this.form.tx_foto)
            {
                if(this.form.tx_foto.length > 0)
                {
                    this.file = { size: 10, type: 'image/jpeg', src: fullSrc, name:this.form.tx_foto }                
                }
            }
        },

        fileToSrc()
        {
        
            let reader = new FileReader();

            reader.readAsDataURL(this.file);

            reader.onload = () => {
                this.form.tx_src = reader.result;
            };

            reader.onerror = () => {
                this.form.tx_src=null;
            };

        },

        cancel()
        {
            this.$refs.form.resetValidation()
            this.mapForm()
            this.setRelations()
        }
    }
}
</script>

<style>
 .v-file-input .v-icon{
     font-size: 60px !important;
     color: var(--v-info-base);
     margin: 8px;
     opacity: 0.8;
 }
  .v-file-input .v-icon:hover{
     opacity: 1;
 }
</style>