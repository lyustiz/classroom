<template>

    <v-container fluid class="book-container ">       
      
      <v-row dense class="fill-height">

        <v-col cols="auto" class="amber lighten-2">

            <v-row no-gutters class="flex-column">

                <app-button small :size="30" innerClass="ma-1" color="green" label="Volver al Inicio" icon="mdi-home" @click="$emit('closeModal')" ></app-button>
                <select-tema temas="temas"></select-tema> 
             
                <v-spacer class="my-3"></v-spacer>

                <select-actividad :actividades="actividades" @showActividad="dialogActividad = true"></select-actividad>
               
                <v-spacer class="my-3"></v-spacer>

                <select-previo :previos="previos"></select-previo>
                <select-lectura :lecturas="lecturas"></select-lectura>
                <select-guia :guias="guias"></select-guia>

                <v-spacer class="my-3"></v-spacer>

                <select-multimedia :multimedias="multimedias"></select-multimedia>
                <select-enlace :enlaces="enlaces"></select-enlace>

            </v-row>

        </v-col>
        
        <v-col class="grey lighten-4 text-center rounded-lg">
            <v-slider
                v-model="currentPage"
                step="2"
                :max="(lastPage >= 2 ) ? lastPage-2: lastPage"
                min="0"
                class="mb-n7 mt-n3 px-2 pointer"
                ticks
                tick-size="24"
            ></v-slider>

            <div class="book-holder">
                <canvas ref="book" id="book" :class="cursor" @click="setZoom($event)" class="rounded-lg"></canvas>

                <v-speed-dial
                    v-model="tools"
                    top
                    right
                    direction="bottom"
                    transition="scale-transition"
                    fixed
                    class="mr-5 mt-5"
                >
                    <template v-slot:activator>
                        <v-btn v-model="tools" dark color="blue" small fab>
                            <v-icon  v-if="tools">mdi-close</v-icon>
                            <v-icon  v-else>mdi-tools</v-icon>
                        </v-btn>
                    </template>
                    <v-btn fab dark small color="orange" >
                        <v-icon>mdi-bookmark-plus</v-icon>
                    </v-btn>
                    <v-btn fab dark small color="green" >
                        <v-icon>mdi-lead-pencil</v-icon>
                    </v-btn>
                    <v-btn fab dark small color="indigo" >
                        <v-icon>mdi-format-annotation-plus</v-icon>
                    </v-btn>
                    <v-btn fab dark small color="red" >
                        <v-icon>mdi-eraser</v-icon>
                    </v-btn>
                </v-speed-dial>

                <v-btn color="success lighten-5" icon fixed left class="ml-14 mt-2" dark>
                    <v-icon v-if="cursor == 'pointer'" size="42" color="green" @click="activeZoom()">mdi-magnify-plus-outline</v-icon>
                    <v-icon v-if="cursor == 'zoom-out'" size="42" color="green" @click="zomOut()">mdi-magnify-minus-outline</v-icon>
                </v-btn>

                <v-btn color="success" icon fixed left bottom class="ml-14 mb-16" @click="prev()" :disabled="loading"><v-icon size="48" color="green">mdi-menu-left</v-icon></v-btn>
                <v-btn color="success" icon fixed right bottom class="mr-5 mb-16" @click="netx()" :disabled="loading"> <v-icon size="48" color="green">mdi-menu-right</v-icon></v-btn>

                <v-overlay 
                    absolute
                    color="amber"
                    :opacity="0.3"
                    :value="loading"
                    :z-index="10">
                    <v-icon size="40" class="mdi-spin">mdi-loading</v-icon>
                </v-overlay>

            </div>
        </v-col>

    </v-row>
 
    <v-dialog v-model="dialogActividad" fullscreen  content-class="cyan lighten-3">
        <app-actividad :actividad="actividad" @closeModal="closeDialog('dialogActividad')" v-if="dialogActividad"></app-actividad>
    </v-dialog>

    <v-dialog v-model="dialogVideo" width="80vw"  content-class="black rounded-xl">
        <visor-video :video="{src: '/storage/recurso/guia/3/1596209029_virtualin.mp4'}" @closeModal="closeDialog('dialogVideo')" v-if="dialogVideo"></visor-video>
    </v-dialog>

     <v-dialog v-model="dialogAudio"  width="450" content-class="rounded-xl primary" hide-overlay >
        <visor-audio :audio="{src: '/storage/recurso/audio/1/fundamentos_macroeconomia.mp3'}" @closeModal="closeDialog('dialogAudio')" v-if="dialogAudio"></visor-audio>
    </v-dialog>
                
                
    </v-container>
  
</template>

<script>
import AppActividad from './AppActividad'
import VisorVideo   from './VisorVideo'
import VisorAudio   from './VisorAudio'

//selects
import SelectTema       from './SelectTema'
import SelectActividad  from './SelectActividad'
import SelectPrevio     from './SelectPrevio'
import SelectLectura    from './SelectLectura'
import SelectGuia       from './SelectGuia'
import SelectEnlace     from './SelectEnlace'
import SelectMultimedia from './SelectMultimedia'

export default {

     components: { 
        'app-actividad':     AppActividad,
        'visor-video':       VisorVideo,
        'visor-audio':       VisorAudio,
        'select-tema':       SelectTema,
        'select-actividad':  SelectActividad,
        'select-previo':     SelectPrevio,
        'select-lectura':    SelectLectura,
        'select-guia':       SelectGuia,
        'select-enlace':     SelectEnlace,
        'select-multimedia': SelectMultimedia,
    },

    mounted()
    {
        this.$nextTick().then( () => 
        {
            this.book        = this.$refs['book'];
            this.context     = this.book.getContext('2d');  
            this.currentPage = 0;
            this.pages       = this.libro.pagina;

            if(this.pages.length > 0 )
            {
                this.lastPage = this.pages.length
                this.loadBook()
            }else{
                this.showError('El libro no posee Paginas')
            }
        })
    },

    watch:
    {       
        currentPage(newPage, oldpPage)
        {
           if((newPage != oldpPage)  && (oldpPage !=null) )
            {
                this.loadBook()
            }
        }
    },

    props:
    {
        libro:{
            type: Object,
            default: () => {}
        }
    },

    computed:
    {
        basePath() {
            return `/storage/libro/${this.libro.id_grado}/${this.libro.id_materia}/${this.libro.id}`
        },

        srcLeft() {
            return this.pages[this.currentPage].tx_path
        },

        srcRight() {
            return this.pages[this.currentPage+1].tx_path
        }
    },

    data()
    {
        return {
            book:        false,
            context:     false,
            pages:       [ ],
            currentPage: null,
            lastPage:    1,
            tools:       false,
            cursor:      'pointer',
            pageLeft:    new Image(),
            pageRight:   new Image(),
            imageLeft:   null,
            imageRigth:  null,
            drawLeft:    false,
            drawRigth:   false,

            loading:     false,

            //
            actividad:       false,
            dialogActividad: false,
            dialogVideo:     false,
            dialogAudio:     false,

            temas:       [],
            actividades: [],
            previos:     [],
            lecturas:    [],
            guias:       [],
            enlaces:     [],
            multimedias: [],
        }
    },
    
    methods:
    {
        loadBook() {
   
            this.pageLeft.src = `${this.basePath}/${this.srcLeft}`;

            this.pageRight.src = `${this.basePath}/${this.srcRight}`;

            this.pageLeft.onload = (img) => { 
                this.book.width  = this.pageLeft.width * 2 
                this.book.height = this.pageLeft.height 
                this.drawLeft    = true
                this.drawPages()
            }; 

            this.pageRight.onload = (img) => { 
                this.drawRigth    = true
                this.drawPages()
            };
        }, 

        drawPages()
        {
            this.loading = true
            
            if(this.drawLeft && this.drawRigth)
            {
                this.context.drawImage(this.pageLeft, 0, 0, this.pageLeft.width, this.pageLeft.height) 
                this.context.drawImage(this.pageRight, this.pageLeft.width, 0, this.pageRight.width, this.pageRight.height)
                this.loading = false 
            }
        },

        activeZoom()
        {
            this.cursor = 'zoom-in'
        },

        setZoom(clickEvent){

            if( this.cursor == 'zoom-in')
            {
                let position = this.mousePosition(event)
                this.zomIn(position)  
            } 
            else if (this.cursor == 'zoom-out')
            {
                this.zomOut()               
            } 
        },

        zomIn(position) {
            
            this.book.height = this.book.height * 2 

            if( position.x >= position.canvas.width / 2 )
            {
                this.context.drawImage(this.pageRight, 0, 0, this.pageRight.width * 2, this.pageRight.height * 2) 
            }else
            {
                this.context.drawImage(this.pageLeft, 0, 0, this.pageLeft.width * 2 , this.pageLeft.height * 2) 
            }
            this.cursor = 'zoom-out'
        },

        zomOut(position) {

            this.book.height = this.book.height / 2 
            this.loadBook()
            this.cursor = 'pointer'
        },

        mousePosition(clickEvent) {
            let rect = this.book.getBoundingClientRect()
            return {
                canvas:{ height: rect.height, width: rect.width, x: rect.left, y: rect.top},
                x: event.clientX - rect.left,
                y: event.clientY - rect.top
            }
        },

        netx(){

            if(this.currentPage+2 < this.lastPage)
            {
                this.currentPage += 2    
            }
        },

        prev(){
            this.currentPage-2 >= 0
            {
                this.currentPage -= 2
            } 
        },

        closeDialog(dialog)
        {
            this[dialog] = false
            this.libroSelected = false
        }
    }

}
</script>

<style scoped>
.book-holder{
    max-width: 99.8%;
}
#book{
    width: 100%;
    height: auto;
}

/* .alias {cursor: alias;}
.all-scroll {cursor: all-scroll;}
.auto {cursor: auto;}
.cell {cursor: cell;}
.context-menu {cursor: context-menu;}
.col-resize {cursor: col-resize;}
.copy {cursor: copy;}
.crosshair {cursor: crosshair;}
.default {cursor: default;}
.e-resize {cursor: e-resize;}
.ew-resize {cursor: ew-resize;}
.grab {cursor: -webkit-grab; cursor: grab;}
.grabbing {cursor: -webkit-grabbing; cursor: grabbing;}
.help {cursor: help;}
.move {cursor: move;}
.n-resize {cursor: n-resize;}
.ne-resize {cursor: ne-resize;}
.nesw-resize {cursor: nesw-resize;}
.ns-resize {cursor: ns-resize;}
.nw-resize {cursor: nw-resize;}
.nwse-resize {cursor: nwse-resize;}
.no-drop {cursor: no-drop;}
.none {cursor: none;}
.not-allowed {cursor: not-allowed;}
.pointer {cursor: pointer;}
.progress {cursor: progress;}
.row-resize {cursor: row-resize;}
.s-resize {cursor: s-resize;}
.se-resize {cursor: se-resize;}
.sw-resize {cursor: sw-resize;}
.text {cursor: text;}
.url {cursor: url(myBall.cur),auto;}
.w-resize {cursor: w-resize;}
.wait {cursor: wait;} */
.zoom-in {cursor: zoom-in;}
.zoom-out {cursor: zoom-out;} 

</style>