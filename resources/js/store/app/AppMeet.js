export default
{
	state(){
		return{
            microphone:    null,
            speaker:       null,
            camera:        null,
            hasMicrophone: null,
            hasSpeaker:    null,
            hasCamera:     null
		}
	},

	getters:
	{
        getMicrophone:    state => state.microphone,    
        getSpeaker:       state => state.speaker,
        getCamera:        state => state.camera,
        getHasMicrophone: state => state.hasMicrophone,
        getHasSpeaker:    state => state.hasSpeaker,
        getHasCamera:     state => state.hasCamera
	},

	mutations:
	{
        setMicrophone (state, microphone) {
            state.microphone = microphone
        },

        setSpeaker (state, speaker) {
            state.speaker = speaker
        },

        setCamera (state, camera) {
            state.camera = camera
        },

        setHasMicrophone (state, hasMicrophone) {
            state.hasMicrophone = hasMicrophone
        },

        setHasSpeaker (state, hasSpeaker) {
            state.hasSpeaker = hasSpeaker
        },

        setHasCamera (state, hasCamera) {
            state.hasCamera = hasCamera
        },
	}
}