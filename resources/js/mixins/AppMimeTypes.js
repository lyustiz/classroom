export default {

    data () {
        return {

            fileType:   null,

            fileTypes: [
                { name: 'Word',       icon: 'mdi-microsoft-word', color:'cyan', mime: 'application/msword' },
                { name: 'Excel',      icon: 'mdi-microsoft-excel', color:'green', mime: 'application/vnd.ms-excel' },
                { name: 'PowerPoint', icon: 'mdi-microsoft-powerpoint', color:'orange', mime: 'application/vnd.ms-powerpoint' },
                { name: 'Texto',      icon: 'mdi-text-box', color:'primary', mime: 'text/plain' },
                { name: 'PDF',        icon: 'mdi-file-pdf-box', color:'red', mime: 'application/pdf' },
                { name: 'Word',       icon: 'mdi-microsoft-word', color:'cyan', mime: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' },
                { name: 'Excel',      icon: 'mdi-microsoft-excel', color:'green', mime: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' },
                { name: 'PowerPoint', icon: 'mdi-microsoft-powerpoint', color:'orange', mime: 'application/vnd.openxmlformats-officedocument.presentationml.presentation' },
                { name: 'Image',      icon: 'mdi-file-image', color:'red', mime: 'image/*' },
                { name: 'Audio',      icon: 'mdi-music-circle', color:'orange', mime: 'audio/mpeg' },
            ],
            
        }
    },
    methods:
    {
        fileTypesByName(mimeName)
        {
            return this.fileTypes.filter(filetype => filetype.name == mimeName)
        },

        fileTypesByTypes(mimeType)
        {
            return this.fileTypes.filter(filetype => filetype.mime == mimeType)
        },

        getTypeAccept()
        {
            this.mimes = []
            
            if( this.fileType ) {
                this.fileType.forEach(types => this.mimes.push(types.mime) )
            }

            return this.mimes.join(',') 
        }
     
    }
}