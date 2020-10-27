export default {
    filters:
    {
        formatDate(date)
        {
            if (!date) return null
            date = date.substr(0, 10)
            const [year, month, day] = date.split('-')
            return `${day}/${month}/${year}`
        },

        yearFromDate(date)
        {
            if (!date) return null
            const [year, month, day] = date.split('-')
            return year
        },

        hourFromDate(date)
        {
            if (!date) return null
            date = date.substr(-5)
            return date
        },

        monthDayFromDate(date)
        {
            if (!date) return null
            const [year, month, day] = date.split('-')
            return `${day}-${this.months[month-1]}`
        },

        formatTime(time)
        {
            if (!time) return null

            let  hour, minutes, second, ampm

            if(time.length <= 5 )
            {
                [hour, minutes] = time.split(':')

            } else
            {
                [hour, minutes, second] = time.split(':')

                if (minutes.length > 2)
                {
                    [minutes, ampm] = second.split(' ')
                }
            }
            
            hour = parseInt(hour);

            ampm = (hour > 12) ? 'pm' : 'am'

            hour = (hour > 12) ?  (hour - 12) : hour

            hour = (hour < 10 )  ? '0' + hour : hour

            return `${hour}:${minutes} ${ampm}`
        }, 

        formatNumber(value)
        {
            let val = (value/1).toFixed(2).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
        },

        toBoolean(value)
        {
            return (value == 1) ? true : false 
        },

        initLeter(value)
        {
            return (value) ? value.charAt(0).toUpperCase() : null 
        },

        maxStringLength(value, length)
        {
            return  (value) ? value.substr(0, length) : null;
        }

    },

    methods:
    {
        formatDate (date)
        {
            if (!date) return null

            const [year, month, day] = date.split('-')
            return `${day}/${month}/${year}`
        },

        dayFromDate(date)
        {
            if (!date) return null
            const [year, month, day] = date.split('-')
            return day
        },

        monthFromDate(date)
        {
            if (!date) return null
            const [year, month, day] = date.split('-')
            return month
        },

        monthDayFromDate(date)
        {
            if (!date) return null
            const [year, month, day] = date.split('-')
            return `${day}-${this.months[month-1]}`
        },

        yearFromDate(date)
        {
            if (!date) return null
            const [year, month, day] = date.split('-')
            return year
        },

        monthNameFromDate(date)
        {
            if (!date) return null
            const [year, month, day] = date.split('-')
            return  this.months[month-1]
        },

        formatTime(time)
        {
            if (!time) return null

            let  hour, minutes, second, ampm

            if(time.length <= 5 )
            {
                [hour, minutes] = time.split(':')

            } else
            {
                [hour, minutes, second] = time.split(':')

                if (minutes.length > 2)
                {
                    [minutes, ampm] = second.split(' ')
                }
            }
            
            hour = parseInt(hour);

            ampm = (hour > 12) ? 'pm' : 'am'

            hour = (hour > 12) ?  (hour - 12) : hour

            hour = (hour < 10 )  ? '0' + hour : hour

            return `${hour}:${minutes} ${ampm}`
        }, 

        formatNumber: function (value)
        {
            let val = (value/1).toFixed(2).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
        },

        hourFromDate(date)
        {
            if (!date) return null
            date = date.substr(-5)
            return date
        },

        capitalize(value)
        {
            return value.charAt(0)
                   .toUpperCase() + value.slice(1)
        },
        
        capitalizeSentence(value)
        {
            return value.toLowerCase()
                   .split(' ')
                   .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
                   .join(' ');
        },
        
    },
    data() {
        return {
            months: [   
                        'enero', 
                        'febrero',
                        'marzo',
                        'abril',
                        'mayo',
                        'junio',
                        'julio',
                        'agosto',
                        'septiembre',
                        'octubre',
                        'noviembre',
                        'diciembre'
                    ],
            days:   [   
                        'lunes', 
                        'martes',
                        'miercoles',
                        'jueves',
                        'viernes',
                        'sabado',
                        'domingo',
                    ],
            colors: [
                        'purple',
                        'indigo',
                        'teal',
                        'light-green',
                        'amber',
                        'deep-orange',
                        'blue-grey',
                        'brown',
                        'deep-purple',
                        'pink',
                        'blue',
                        'cyan',
                        'red'
                    ],
            sexoIcons: 
            [
                {value: 'M', icon: 'mdi-human-male',   color: 'blue', label: 'Masculino'},
                {value: 'F', icon: 'mdi-human-female', color: 'pink', label: 'Femenino'}
            ],
            statusIcons:
            [
                {value: 0, icon: 'mdi-checkbox-blank-circle-outline', color: 'error',   label: 'No'},
                {value: 1, icon: 'mdi-checkbox-marked-circle',        color: 'success', label: 'Si'}
            ],
            visibleIcons:
            [
                {value: 0, icon: 'mdi-eye-off', color: 'grey',    label: 'No'},
                {value: 1, icon: 'mdi-eye',     color: 'success', label: 'Si'}
            ],
            calificacionIcons:
            [
                {value: 1, icon: 'mdi-checkbox-marked-circle-outline', color: 'success', label: 'Aprobado'},
                {value: 0, icon: 'mdi-close-circle-outline',           color: 'error',   label: 'Reprobado'}
            ],
            selectMinutos: [
                5,10,15,20,25,30,35,40,45,50,60,65,70,75,80,85,90,95,100,105,110,120
            ],
            grupoAsistente: [
                { id: 1, nb_grupo: 'secretaria'},
                { id: 1, nb_grupo: 'docente'},
                { id: 1, nb_grupo: 'alumno'},
                { id: 1, nb_grupo: 'acudiente'},
                { id: 1, nb_grupo: 'empleado'},
            ]
        }
    },

}
