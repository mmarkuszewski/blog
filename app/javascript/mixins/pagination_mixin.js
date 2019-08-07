export default {
    data() {
        return {
            pageNum: 1
        }
    },
    methods: {
        nextPage(){
            this.pageNum++;
        },
        prevPage(){
            this.pageNum--;
        },
    },
}