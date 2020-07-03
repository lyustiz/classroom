export default {

    computed:
    {
        mimeTypes()
        {
            let mimes = []

            this.fileTypes.forEach(types => mimes.push(types.mime) )
               
            return  mimes = mimes.join(',')
        },
    },

    data () {
        return {

            fileType:   null,

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
            
        }
    },
    methods:
    {
     
        getFileType(mimeName)
        {
            return  this.fileTypes.find(type => type.name == mimeName)
        },
     
    }
}