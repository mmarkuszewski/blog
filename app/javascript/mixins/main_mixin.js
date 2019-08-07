export default {
    methods: {
        header: function() {
            return {
                    'X-CSRF-Token': document
                    .querySelector('meta[name="csrf-token"]')
                    .getAttribute('content')
                    }
        },
        nextPage(){
            this.pageNum++;
        },
        prevPage(){
            this.pageNum--;
        },
    },
}