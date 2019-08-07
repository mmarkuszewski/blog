import MainMixin from './main_mixin'

export default {
    mixins: [MainMixin],
    methods: {
        //zbiera treści błędów w przypdaku zapytan do devise nie zakonczonych sukcesem
        getFlashErrors: function(response) {
            for(let subject in response.data.errors){
                for(let err of response.data.errors[subject]){
                    this.flashError(subject + ' ' + err,{
                        timeout: 3000,
                    });

                }
            }
        }
    },
}