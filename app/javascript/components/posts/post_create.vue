<template>
    <div align="center">
        <div class="col-4">

            <h1> Create Post </h1>

            <form v-on:submit.prevent="onSubmit">
                <label>Title:</label>
                <input v-model="title">
                <label>Content:</label>
                <textarea rows="4" cols="40" v-model="content"></textarea>
                <label>Picture:</label>
<!--                TODO:obrazki-->
<!--                <picture-input></picture-input>-->
<!--                <input v-model="picture">-->
                <input type="submit" value="Create Post">
            </form>

        </div>
    </div>
</template>

<script>
    import postMixin from '../../mixins/post_mixin'

    export default {
        name: "post_create",
        mixins: [postMixin],
        data() {
            return {
                title: null,
                content: null,
            }
        },
        methods: {
            onSubmit: function(){
                this.$axios.post('/admin/posts',{
                        post: {
                            title: this.title,
                            content: this.content,
                        }},
                    {
                        headers: this.header()
                    })
                    .then(response => {
                        this.flashSuccess("Post was created",{
                            timeout: 3000,
                        });
                        this.$router.replace('/')
                    })
                    .catch(e => {
                        this.getFlashErrors(e.response)
                    })
            }
        }
    }
</script>

<style scoped>

</style>