export default {
    methods: {
        getFlashErrors(response) {
            for(let subject in response.data){
                for(let err of response.data[subject]){
                    this.flashError(subject + ' ' + err,{
                        timeout: 3000,
                    });
                }
            }
        }
    },
}
