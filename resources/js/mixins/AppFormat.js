export default {
    filters:
    {
        formatDate(date)
        {
            if (!date) return null
            const [year, month, day] = date.split('-')
            return `${day}/${month}/${year}`
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
        formatNumber: function (value)
        {
            let val = (value/1).toFixed(2).replace('.', ',')
            return val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".")
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
        
    }
}
