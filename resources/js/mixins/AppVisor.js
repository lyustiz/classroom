import AppData   from '@mixins/AppData';

export default 
{
    mixins: [AppData],    
    props:
    {
        evaluar: {
            type: Boolean,
            default: false
        },

        segundos: {
            type: Number,
            default: 60
        },

        asignacion: {
            type: Object,
            default: ()  => {}
        }
    },

    created()
    {
        if(this.evaluar)
        {
            if(this.validarData())
            {
                this.time = ( this.segundos )  ? this.segundos :  this.asignacion.asignacion.tipo_asignacion.nu_tiempo
                this.registroAcceso()
                this.conteo()
            }
        }
    },

    beforeDestroy()
    {
        clearInterval(this.timer)
    },

    computed:
    {
        alumno()
        {
            return this.$store.getters['getAlumno']
        }
    },

    data()
    {
        return {
            isCompleted: false,
            time: 0,
            timer: null,
            form: {
                id_usuario: this.IdUser
            }
        }
    },

    methods: {

        validarData()
        {           
            if(!this.asignacion.id) {
                this.showError('Error en Asignacion')
                return
            }

            if(!this.segundos) {
                this.showError('Error en criterios de evaluacion')
                return
            }

            if(!this.asignacion.id_alumno) {
                this.showError('Error en datos alumno')
                return
            }

            if(this.asignacion.fe_completado) {
                this.showMessage('Actividad Completada')
                this.isCompleted = true
                return true
            }

            return true
        },

        registroAcceso()
        {
            this.updateResource(`asignacionAlumno/${this.asignacion.id}/acceso`, this.form).then( (data) => {

            })

        },

        registroCompletado()
        {
            if(this.isCompleted) return
            
            this.updateResource(`asignacionAlumno/${this.asignacion.id}/completada`, this.form).then( (data) => {
                this.isCompleted = true
                this.$emit('onClomplete')
            })
        },

        conteo() 
        {
            if (!this.timer) {
                this.timer = setInterval( () => {
                    if (this.time > 0) {
                        this.time--
                    } else {
                       clearInterval(this.timer)
                       this.registroCompletado()
                    }
                }, 1000 )
            }
        },

    }
}
