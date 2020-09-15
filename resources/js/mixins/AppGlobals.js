export default 
{
    data()
    {
        return{
            report: {
                show:  false,
                table: null,
                title: null 
            }
        }
    },

    props:
    {
        inDialog: {
            type:    Boolean,
            default: false 
        },
    },
    
    methods: 
    {
        navegateTo(route)
        {
            this.$router.push(route).catch(err => {})
        },

        navegateToName(routeName)
        {
            this.$router.push({ name: routeName }).catch(err => {})
        },

        formatPicker(date, picker)
        {
            this.pickers[picker] = false;

            return this.formatDate(date)
        },

         //acciones de los menus

         onMenu(menu) //compatibilidad versiones anteriores
         {
             switch (menu.action) {
                 case 'refresh':
                     this.list()
                     break;
             
                 default:
                     break;
             }
         },
 
         onItemMenu(menu)
         {
             try {
                 this[menu.action](menu.item)
             } catch (error) 
             {
                 console.log(error, menu)
             }
         },
 
         onListMenu(menu)
         {
             try {
                 this[menu.action]()
             } catch (error) 
             {
                 console.log(error, menu)
             }
         },

        onReport(report)
        {
            if(this.report)
            {
                this.report.show  = true
                this.report.table = report.table
                this.report.title = report.title
            } else{
                this.report.show  = false
                this.report.table = null
                this.report.title = null
            }
        },

        onCloseReport()
        {
            this.report.show  = false
            this.report.table = null
            this.report.title = null
        }
    }
}
