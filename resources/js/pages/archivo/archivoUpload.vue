<template>
 <div>

    <app-simple-toolbar :title="title" @closeModal="$emit('closeModal')"></app-simple-toolbar>

    <list-container inDialog>
    
    <v-row>
        <v-col>
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

                    <menu-items :itemsMenu="filesMenu" :item="file" iconColor="green lighten-5" @onMenu="onMenu($event)"></menu-items>

                </v-list-item-action>

                 <a class="d-none" :ref="file.id" rel="noreferrer noopener" target="_blank" :href="file.tipo_archivo.tx_base_path + file.tx_origen_id + '/' + file.tx_path" :download="file.nb_real"></a>

            </v-list-item>
            </v-list-item-group>
        </v-list>
        </v-col>
    </v-row>

    <v-row justify="center">
        <v-col cols="12" md="6" class="text-center">
            <v-file-input 
                placeholder="Seleccione un archivo"
                :accept="mimeTypes" 
                v-model="fileUpload"
                color="info"
                rounded
                dense
                :loading="loading"
                :disabled="loading"
                @change="setFiles()"
                filled>
            </v-file-input>
        </v-col>
    </v-row>

    <app-modal
        :modal="modal"
        @closeModal="closeModal()"
        :head-color="$App.theme.headModal"
        :title="title">
        <archivo-form
            :file="file"
            :origen="origen"
            :origenId="origenId"
            :tipoArchivo="tipoArchivo"
            :fileType="fileType"
            :fileName="fileName"
            :action="action"
            :item="item"
            @closeModal="closeModal()"
        ></archivo-form>

    </app-modal>

    <form-delete
        :dialog="dialog"
        :loading="loading"
        message="Desea eliminar el Archivo Seleccionado?"
        @deleteItem="deleteItem()"
        @deleteCancel="deleteCancel()"
    ></form-delete>

    

    <pre v-if="$App.debug">{{ $data }}</pre>

    </list-container>
</div>
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

        maxItems: {
            type:       Number,
            default:    5
        },
    },

    watch:
    {
        origenId()
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
                    label: 'Eliminar',
                    icon:  'mdi-delete',
                    action: 'delete'
                },
                {
                    label: 'Editar',
                    icon:  'mdi-lead-pencil',
                    action: 'edit'
                },
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
        deleteItem ()
        {
            this.loading = true

            axios.delete(`${this.apiUrl}archivo/${this.item.id}`)
            .then(response => 
            {
                this.showMessage(response.data.msj)
                this.item = {};
                this.list();
            })
            .catch(error => 
            {
                this.showError(error)
            })
            .finally( () => 
            {
                this.loading = false
                this.dialog  = false;
            });
        },

        setFiles()
        {
           if(this.fileUpload)
            {
                if(this.isMaxFiles()) return 

                if(!this.validSize()) return 

                this.loading = true

                let reader = new FileReader();

                reader.readAsDataURL(this.fileUpload);

                reader.onprogress = () => 
                {
                    this.loading = true
                }

                reader.onload = () => 
                {
                    this.file = reader.result

                    let type = this.file.split(';')[0].split(':')[1]

                    this.fileType = this.fileTypes.filter(filetype => filetype.mime == type)[0]

                    this.fileName = this.fileUpload.name

                    this.fileUpload = null

                    this.modal = true

                    this.action = 'ins';

                    this.loading = false
                };

                reader.onerror = () => 
                {
                   this.showError({ msj: 'error al intentar cargar el archivo'})
                };
            }
        },

        getFileType(mimeName)
        {
            return  this.fileTypes.find(type => type.name == mimeName)
        },

        validSize()
        {
            if(this.fileUpload.size/1048576 > 10)
            {
                this.showError('Tamaño de archivo excede los 10 MB ('+ file.size/1048576 + ')MB')
                this.fileUpload = null
                return false
            }
            return true
        },

        isMaxFiles()
        {
            if(this.items.length >= this.maxItems)
            {
                this.fileUpload = null
                this.showError('Solo se permiten la carga de '+ this.maxItems+ ' archivos')
                return true
            }
            return false
        },

        updateForm (item)
        {
            this.action = 'upd';
            this.modal  = true;
            this.item   = item;
            this.fileType =  this.getFileType(item.tx_mimetype);  
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

                case 'delete':
                    this.deleteForm(payload.item)
                    break;

                case 'edit':
                    this.updateForm(payload.item)
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