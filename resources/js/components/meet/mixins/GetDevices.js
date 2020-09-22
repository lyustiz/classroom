export default 
{

    data() 
    {
        return {

            devide: null
        }
    },


    /**
     * 
     *  const videoElement = document.querySelector('video');
        const audioInputSelect = document.querySelector('select#audioSource');
        const audioOutputSelect = document.querySelector('select#audioOutput');
        const videoSelect = document.querySelector('select#videoSource');
        const selectors = [audioInputSelect, audioOutputSelect, videoSelect];
     */
    methods: 
    {
        gotDevices(deviceInfos) {
            
            for (let i = 0; i !== deviceInfos.length; ++i) {
                const deviceInfo = deviceInfos[i];
                const option = document.createElement('option');
                option.value = deviceInfo.deviceId;
                if (deviceInfo.kind === 'audioinput') {
                option.text = deviceInfo.label || `microphone ${audioInputSelect.length + 1}`;
                audioInputSelect.appendChild(option);
                } else if (deviceInfo.kind === 'audiooutput') {
                option.text = deviceInfo.label || `speaker ${audioOutputSelect.length + 1}`;
                audioOutputSelect.appendChild(option);
                } else if (deviceInfo.kind === 'videoinput') {
                option.text = deviceInfo.label || `camera ${videoSelect.length + 1}`;
                videoSelect.appendChild(option);
                } else {
                console.log('Some other kind of source/device: ', deviceInfo);
                }
            }
            selectors.forEach((select, selectorIndex) => {
                if (Array.prototype.slice.call(select.childNodes).some(n => n.value === values[selectorIndex])) {
                select.value = values[selectorIndex];
                }
            });
        }
    }
}
