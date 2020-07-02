<template>

    <v-dialog v-model="modal" persistent width="600" content-class="rounded-xl">
        
    <template v-slot:activator="{ on }">
            <v-badge left color="red" :value="hasArchivo" overlap dot bordered v-on="on">
                <v-btn fab class="my-1" dark x-small color="cyan lighten-2" @click="modal = !modal">
                    <v-icon>mdi-paperclip</v-icon>
                </v-btn>
            </v-badge>
    </template>

    <v-card class="rounded-xl" flat :loading="loading">

       <v-toolbar dark flat :color="$App.theme.headModal">

            <v-btn icon x-small dark class="mx-1" @click.native="modal=false">
                <v-icon>mdi-close-circle</v-icon>
            </v-btn>

            <v-toolbar-title>Archivo</v-toolbar-title>

            <v-spacer></v-spacer>

            <v-btn icon @onMenu="onMenu($event)">
                <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>
        
        </v-toolbar>
    
        <v-card-text>
  
            <v-list two-line rounded>

            <v-list-item-group color="primary">
            <v-list-item v-for="(file, idx) in items" :key="idx" >

                <v-list-item-avatar :color="getFileType(file.tx_mimetype).color">
                        <v-tooltip right color="green lighten-2" open-on-click>
                        <template v-slot:activator="{ on }">
                            <v-icon 
                                v-on="on"
                                color="white"
                                v-text="getFileType(file.tx_mimetype).icon"
                            ></v-icon>
                        </template>
                        <span>{{file.tx_observaciones }}</span>
                    </v-tooltip>
                    
                </v-list-item-avatar>

                <v-list-item-content class="my-0 py-0 " >
                    <v-list-item-title v-text="file.nb_archivo"></v-list-item-title>
                    <v-list-item-subtitle v-text="file.nb_real"></v-list-item-subtitle>
                </v-list-item-content>

                <v-list-item-action>
                    <menu-items 
                        :itemsMenu="filesMenu" 
                        :item="file" 
                        iconColor="green lighten-5" 
                        @onMenu="onMenu($event)">
                    </menu-items>
                </v-list-item-action>

                 <a class="d-none" :ref="file.id" rel="noreferrer noopener" target="_blank" :href="file.tipo_archivo.tx_base_path + file.tx_path" :download="file.nb_real"></a>

            </v-list-item>
            </v-list-item-group>

            </v-list>
     
        </v-card-text>

    <pre v-if="$App.debug">{{ $data }}</pre>

    </v-card>
</v-dialog>
</template>

<script>
import listHelper from '@mixins/Applist';
import ArchivoForm  from './archivoForm';
import MenuItems  from '@components/list/ListMenu';
export default {

    components: { 
        'archivo-form': ArchivoForm,
        'menu-items': MenuItems
    },

    mixins:     [ listHelper],

    props:
    {
        origen: {
            type:       String,
            default:    null
        },

        origenId: {
            type:       Number,
            default:    1
        },

        tipoArchivo: {
            type:       Number,
            default:    1
        },

        hasArchivo:
        {
            type: Boolean,
            default: false
        }
    },

    watch:
    {
        modal()
        {
            this.items = []
            this.resource =   `archivo/tipoArchivo/${this.tipoArchivo}/origen/${this.origenId}`
            this.list()
        }

    },

    computed:
    {
        mimeTypes()
        {
            let mimes = []
            this.fileTypes.forEach(types => {
                mimes.push(types.mime) 
            });
           return  mimes = mimes.join(',')
        },
    },

    data () {
        return {
            title:      'Archivos',
            resource:   `archivo/tipoArchivo/${this.tipoArchivo}/origen/${this.origenId}`,
            fileUpload: [],
            file:       null,
            fileName:   null,
            fileType:   null,
            loading:    false,
            modal:      false,
            fileTypes: [
                { name: 'Word', icon: 'mdi-microsoft-word', color:'cyan', mime: 'application/msword' },
                { name: 'Excel', icon: 'mdi-microsoft-excel', color:'green', mime: 'application/vnd.ms-excel' },
                { name: 'PowerPoint', icon: 'mdi-microsoft-powerpoint', color:'orange', mime: 'application/vnd.ms-powerpoint' },
                { name: 'Texto', icon: 'mdi-text-box', color:'primary', mime: 'text/plain' },
                { name: 'PDF', icon: 'mdi-file-pdf-box', color:'red', mime: 'application/pdf' },
                { name: 'Word', icon: 'mdi-microsoft-word', color:'cyan', mime: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' },
                { name: 'Excel', icon: 'mdi-microsoft-excel', color:'green', mime: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' },
                { name: 'PowerPoint', icon: 'mdi-microsoft-powerpoint', color:'orange', mime: 'application/vnd.openxmlformats-officedocument.presentationml.presentation' },
                { name: 'Image', icon: 'mdi-file-image', color:'red', mime: 'image/*' },
            ],
            filesMenu: [
                {
                    label: 'Descargar',
                    icon:  'mdi-download',
                    action: 'download'
                }
            ],
            itemsMenu: [
                {
                    label: 'Cerrar',
                    icon:  'mdi-close',
                    action: 'close'
                },
                {
                    label: 'Refrescar',
                    icon:  'mdi-table-refresh',
                    action: 'refresh'
                }
            ]
        }
    },
    methods:
    {
        getFileType(mimeName)
        {
            return  this.fileTypes.find(type => type.name == mimeName)
        },

        closeModal()
        {
            this.action = '';
            this.modal  = false;
            this.list();
        },

        downloadFile(file)
        {
            this.$refs[file.id][0].click()
        },

        onMenu(payload)
        {
            switch (payload.action) {

                case 'refresh':
                    this.list()
                    break;

                case 'close':
                    this.$emit('closeModal')
                    break;
                
                case 'download':
                    console.log(payload.item)
                    this.downloadFile(payload.item)
                    break;
            
                default:
                    break;
            }
        }
    }
}
</script>

<style>
</style>