<template>
    <div align="center">

        <h1> Edit </h1>

        <form v-on:submit.prevent="onSubmit">
            <label>Title:</label>
            <input v-model="title">
            <label>Content:</label>
            <textarea rows="4" cols="40" v-model="content"></textarea>
            <label>Picture:</label>
            <!--                TODO:obrazki-->
<!--            <picture-input></picture-input>-->
            <!--                <input v-model="picture">-->
            <input class="btn btn-primary" type="submit" value="Edit">
        </form>

        <button class="btn btn-primary" @click="deletePost">Delete</button>

    </div>
</template>

<script>
    import postMixin from '../../mixins/post_mixin'

    export default {
        name: "post_edit",
        mixins: [postMixin],
        data() {
            return {
                title: null,
                content: null
            }
        },
        beforeCreate() {
            this.$axios.get('/admin/posts/'+ this.$route.params.id +'/edit'
            ).then(response => {
                this.title = response.data.title
                this.content = response.data.content
            }).catch(e => {
                this.error.push(e)
            })
        },
        methods: {
            onSubmit: function(){
                this.$axios.patch('/admin/posts/' + this.$route.params.id,
                    {
                        post:{
                            title: this.title,
                            content: this.content
                        }
                    },
                    {
                        headers: this.header()
                    }).then(response => {
                        this.flashSuccess('Post edited',{
                            timeout: 3000,
                        });
                    }).catch(e => {
                        this.getFlashErrors(e.response)
                    })
            },
            deletePost: function(){
                this.$axios.delete('/admin/posts/' + this.$route.params.id,
                    {
                        headers: this.header()
                    }).then(response => {
                        this.$router.replace('/')
                        this.flashSuccess('Post deleted',{
                            timeout: 3000,
                        });
                    }).catch(e => {
                        this.getFlashErrors(e.response)
                    })
            }
        }
    }
</script>

<style scoped>

</style>