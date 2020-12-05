<template>

    <v-progress-circular
        :size="size"
        :width="width"
        :value="percent"
        :color="timerColor"
        :indeterminate="loading"
        >
        <div>
            <span class="title-1">{{prettyTime}}</span>
        </div>
    </v-progress-circular>
  
</template>

<script>
export default {

    props: {
        
        minutes:{
            type: Number,
            default: 1
        },

        seconds:{
            type: Number,
            default: 0
        },

        pause: {
            type: Boolean,
            default: false
        },

        size: {
            type: Number,
            default: 100
        },

        width: {
            type: Number,
            default: 10
        },

        loading: {
            type: Boolean,
            default: false
        }
    },

    created()
    {
        this.setTime({ minutes:this.minutes, seconds:this.seconds })
        this.start()
    },


    computed:
    {
        percent()
        {
            return (this.totalTime > 0) ?  this.time * 100 / this.totalTime : 0
        },

        timerColor()
        {
            if( this.percent >= 0 && this.percent <= 10 ) return 'red'
            if( this.percent > 10 && this.percent <= 50 ) return 'orange'
            if( this.percent > 50  ) return 'green'
        },

        prettyTime () 
        {
            let time        = this.time / 60
            let minutes     = parseInt(time)
            let secondes    = Math.round((time - minutes) * 60)
            return minutes.toString().padStart(2, '0') + ":" + secondes.toString().padStart(2, '0')
        },
    },

    data () {
		 return {
            isRunning:  false,
            time:       0,
            totalTime:  1,
            timmer:     null,
            //sound:new Audio("http://s1download-universal-soundbank.com/wav/nudge.wav")
		 }
    },
    
    methods: 
    {
        setTime(time) 
        {
            this.time      = (time.minutes * 60 + time.seconds)
            this.totalTime = this.time
		},

        start () 
        {
            this.isRunning = true
            if (!this.timer) {
                this.timer = setInterval( () => {
                    if (this.time > 0) {
                        this.time--
                    } else {
                            clearInterval(this.timer)
                            this.$emit('onEndTime')
                            this.reset()
                    }
                }, 1000 )
            }
        },
        stop () {
            this.isRunning = false
            clearInterval(this.timer)
            this.timer = null
        },

        reset () {
            this.stop()
            this.time     = 0
           /*  this.secondes = 0
            this.minutes  = 0 */
        },
		 
    },
}
</script>

<style>

</style>



