<template>

<div ref="board-container"  class="board-container" @resize="resize()">

    <v-menu v-model="textMenu" absolute :disabled="disableMenu" :close-on-content-click="false" :close-on-click="false">

        <template v-slot:activator="{ on }">
            
            <canvas class="draw-board rounded-lg" ref="draw-board" v-on="on"
                @mousedown="startDraw($event)"
                @mouseup="stopDraw($event)"
                @mousemove="drawer($event, false)"
                @mouseleave="stopDraw($event)"
            ></canvas>

        </template>

        <v-text-field
            outlined
            v-model="text"
            single-line
            hide-details
            dense
            :color="lineColor"
            append-outer-icon="mdi-close-circle"
            append-icon="mdi-check-circle"
            @click:append="setText($event)"
            @click:append-outer="closeText()"
        ></v-text-field>

    </v-menu>

    <v-speed-dial
        v-model="colors"
        top
        left
        direction="bottom"
        transition="scale-transition"
        absolute
        class="ml-10"
    >
        <template v-slot:activator>
            <v-btn v-model="colors" dark :color="lineColor" fab x-small>
                <v-icon  v-if="colors">mdi-close</v-icon>
                <v-icon  v-else>mdi-palette</v-icon>
            </v-btn>
        </template>
        <v-btn fab dark x-small color="brown" @click="lineColor='#795548'">
            <v-icon>mdi-invert-colors</v-icon>
        </v-btn>
        <v-btn fab dark x-small color="green" @click="lineColor='#4CAF50'">
            <v-icon>mdi-invert-colors</v-icon>
        </v-btn>
        <v-btn fab dark x-small color="indigo" @click="lineColor='#3F51B5'">
            <v-icon>mdi-invert-colors</v-icon>
        </v-btn>
        <v-btn fab dark x-small color="red" @click="lineColor='#F44336'">
            <v-icon>mdi-invert-colors</v-icon>
        </v-btn>
        <v-btn fab dark x-small color="amber" @click="lineColor='#FFC107'">
            <v-icon>mdi-invert-colors</v-icon>
        </v-btn>
        <v-btn fab dark x-small color="black" @click="lineColor='#000000'">
            <v-icon>mdi-invert-colors</v-icon>
        </v-btn>
    </v-speed-dial>

    <v-speed-dial
        v-model="shapeTools"
        left
        top
        direction="bottom"
        transition="scale-transition"
        absolute
    >
        <template v-slot:activator>
            <v-btn v-model="shapeTools" dark :color="shapeColor" fab x-small>
                <v-icon  v-if="shapeTools">mdi-close</v-icon>
                <v-icon  v-else>{{ shapeIcon }}</v-icon>
            </v-btn>
        </template>
        <v-btn fab dark small color="indigo" @click="setShape('circle', 'mdi-shape-circle-plus', 'indigo')">
            <v-icon>mdi-shape-circle-plus</v-icon>
        </v-btn>
        <v-btn fab dark small color="green" @click="setShape('pencil', 'mdi-lead-pencil', 'green')">
            <v-icon>mdi-lead-pencil</v-icon>
        </v-btn>
        <v-btn fab dark small color="red" @click="setShape('text', 'mdi-format-annotation-plus', 'red')">
            <v-icon>mdi-format-annotation-plus</v-icon>
        </v-btn>
        <v-btn fab dark small color="blue" @click="setShape('eraser', 'mdi-eraser', 'blue')">
            <v-icon>mdi-eraser</v-icon>
        </v-btn>
    </v-speed-dial>

    <v-speed-dial
        v-model="tools"
        right
        top
        direction="bottom"
        transition="scale-transition"
        absolute
    >
        <template v-slot:activator>
            <v-btn v-model="colors" dark color="indigo" fab x-small>
                <v-icon  v-if="tools">mdi-close</v-icon>
                <v-icon  v-else>mdi-tools</v-icon>
            </v-btn>
        </template>
        <v-btn fab dark small color="blue" @click="clean()">
            <v-icon>mdi-television-clean</v-icon>
        </v-btn>
        <v-btn fab dark small color="red" @click="fullScreen()">
            <v-icon>{{ (this.isfullScreen) ? 'mdi-fullscreen-exit' : 'mdi-fullscreen'}}</v-icon>
        </v-btn>
        <v-btn fab dark small color="amber" @click="$refs['upload-image'].click()">
            <v-icon>mdi-image-plus</v-icon>
        </v-btn>
        <v-btn fab dark small color="green" @click="downloadImage()">
            <v-icon>mdi-image-area-close</v-icon>
        </v-btn>
    </v-speed-dial>

    <a ref="download-image" class="d-none"></a>
    <input ref="upload-image" class="d-none" type="file" accept="image/x-png,image/gif,image/jpeg" @change="uploadImage($event)">

</div>

</template>

<script>
export default {

    mounted()
    {
        this.container = this.$refs["board-container"]
        this.canvas    = this.$refs['draw-board'];
        this.context   = this.canvas.getContext('2d'); 
        
        this.$nextTick().then( () => {
            this.resize()
            this.clean()
            this.streamCanvas()
        })
    },

    data: () => ({
        container:    null,
        canvas:       null,
        context:      null,
        draw:         false,
        coordinates:  {x:0 , y:0},
        colors:       false,
        lineColor:    '#3F51B5',
        tools:        false,
        shapeTools:   false,
        shapeIcon:    'mdi-lead-pencil',
        shapeColor:   'green',
        shape:        'pencil',
        textMenu:     false,
        disableMenu:  true,
        text:         null,
        isfullScreen: false
    }),

    methods:
    {
        resize()
        {
            if(!this.fullScreen)
            {
               
                this.context.canvas.width  = screen.width;  
                this.context.canvas.height = screen.height  

            }else{
                this.context.canvas.width  = this.container.clientWidth;  
                this.context.canvas.height = this.container.clientHeight;
            }
        },

        streamCanvas()
        {
           try {
              let stream = this.canvas.captureStream(25) 
              this.$emit('onStream', stream) 
           } catch (error) {
               this.showError('Error a iniciar transmision de Pizarra' + error)
           }
        },

        position(event)
        {
           var ClientRect = this.canvas.getBoundingClientRect();

            this.coordinates.x = Math.round(event.clientX - ClientRect.left)
            let top = ((this.container.offsetParent) ? this.container.offsetParent.offsetTop : 0) + this.container.offsetTop  + this.canvas.offsetTop
            this.coordinates.y = Math.round(event.clientY - top)
        },

        startDraw(event){ 
            this.draw = true; 
            this.position(event); 
            this.disableMenu = (this.shape != 'text') ? true : false
        },

        stopDraw()
        {
            this.draw = false; 
        },

        drawer(event, touch)
        {
            if (!this.draw && !touch) return; 

            this.context.lineWidth = 5; 

            this.context.lineCap = 'round'; 
                
            this.context.strokeStyle = this.lineColor; 
                
            this.drawShape(event)
        },

        drawShape(event)
        {   
            switch (this.shape) {
                case 'circle':
                        let pointA, pointB, distance = 0;
                        this.context.beginPath(this.coordinates.x, this.coordinates.y);
                        pointA = {x: this.coordinates.x, y:this.coordinates.y}
                        this.position(event);
                        pointB = {x: this.coordinates.x, y:this.coordinates.y}
                        distance = this.distancePoints(pointA, pointB)
                        this.context.arc(this.coordinates.x, this.coordinates.y, distance, 0, 2 * Math.PI);
                        this.context.stroke();
                    break;
                
                case 'square':
                    this.context.beginPath();
                    this.context.moveTo(this.coordinates.x, this.coordinates.y); 
                    this.position(event); 
                    this.context.lineTo(this.coordinates.x , this.coordinates.y); 
                    this.context.stroke();
                    
                    break;
                
                case 'pencil':
                    this.context.beginPath();
                    this.context.moveTo(this.coordinates.x, this.coordinates.y); 
                    this.position(event);
                    this.context.lineTo(this.coordinates.x , this.coordinates.y); 
                    this.context.stroke();
                    
                    break;
                
                case 'text':
                     this.text = null
                     this.disableMenu= false 
                     this.textMenu = true
                    break;
                
                case 'eraser':
                    this.context.lineWidth = 20; 
                    this.context.strokeStyle = '#FFFFFF';
                    this.context.moveTo(this.coordinates.x, this.coordinates.y); 
                    this.position(event); 
                    this.context.lineTo(this.coordinates.x , this.coordinates.y); 
                    this.context.stroke();
                    
                    break;
            
                default:
                    break;
            }
        },

        setShape(shape, shapeIcon, shapeColor)
        {
            this.shape      = shape
            this.shapeIcon  = shapeIcon
            this.shapeColor = shapeColor
        },

        setText()
        {
            this.context.font = "30px Arial";
            this.context.fillStyle = this.lineColor
            this.context.fillText(this.text, this.coordinates.x, this.coordinates.y);
            this.text = null
            this.textMenu = false
        },

        closeText()
        {
            this.textMenu = false
            this.text     = null
        },

        
        distancePoints(pointA, pointB){
            return Math.sqrt(
                                Math.pow( (pointB.x - pointA.x), 2) +
                                Math.pow( (pointB.y - pointA.y), 2) 
                            );
        },

        clean()
        {
            this.context.fillStyle = "#FFFFFF";
            this.context.fillRect(0, 0, this.context.canvas.width, this.context.canvas.height);
        },

        downloadImage()
        {
            var image = this.canvas.toDataURL("image/png").replace("image/png", "image/octet-stream");

            this.$refs['download-image'].setAttribute('download', 'clase.png');

            this.$refs['download-image'].setAttribute('href', image);

            this.$refs['download-image'].click();
        },

        uploadImage(eventFile)
        {
            let file   = this.$refs['upload-image'].files[0]

            if(!file.type.includes('image/')) {
                this.showError('Formato de imagen Invalid, se acepta PNG, JPG, BMP, GIF')
                return
            }

            let image  = new Image();

            image.src  = URL.createObjectURL(file);

            image.onload = () => this.context.drawImage(image, 0, 0, this.context.canvas.width, this.context.canvas.height);
        },

        fullScreen()
        {
            if(window.innerHeight == screen.height)
            {
                document.exitFullscreen() 
                this.isfullScreen = false
            }else{
                this.container.requestFullscreen() 
                this.isfullScreen = true
            }
            this.resize()
            this.clean()
        },
    } 

}
</script>

<style>
.board-container{
    position: relative;
    height: 50vh;
}

.draw-board {
    cursor: crosshair;
}

.fullscreen{
    width: 100vw;
    height: 100vh;
}

</style>