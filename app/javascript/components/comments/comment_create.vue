<template>
    <div>
        <div v-if="$can('create', 'Comment')">
            <div class="card my-4">
                <h5 class="card-header">Leave a Comment:</h5>
                <div class="card-body">
                    <form v-on:submit.prevent="onSubmit">
                        <div class="form-group">
                            <textarea rows="4" cols="70" v-model="content"></textarea>
                        </div>
                        <input class="btn btn-primary" type="submit" value="Submit">
                    </form>
                </div>
            </div>
        </div>
    </div>

</template>

<script>
    import commentMixin from '../../mixins/comment_mixin'

    export default {
        name: "comment-create",
        mixins: [commentMixin],
        data() {
            return {
                content: null,
            }
        },
        methods: {
            onSubmit() {
                this.$axios.post('/posts/' + this.$route.params.id + '/comments',{
                        user_id: this.$store.state.current_user.id,
                        post: {
                            comment:{
                                content: this.content
                            }
                        }},
                    {
                        headers: this.header()
                    })
                    .then(response => {
                        this.$parent.$data.comments.push(response.data)
                        this.flashSuccess("Comment was created",{
                            timeout: 3000,
                        });

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