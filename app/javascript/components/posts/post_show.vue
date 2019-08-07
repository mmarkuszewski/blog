<template>

    <div class="container">

        <div class="row">
            <div class="col-lg-8">
                <!-- Title -->
                <h1 class="mt-4">{{ post.title }}</h1>
                <img v-if="post.picture_data" width="100%" :src=pictureUrl(post)>

                <!-- Post Content -->
                <p>{{ post.content }}</p>

                <div v-if="$can('manage', 'Post')">
                    <router-link class="btn btn-primary" href="" :to="{ name: 'edit_post' }">Edit</router-link>
                </div>
                <comment-create></comment-create>
                <comments :comments="comments"></comments>

            </div>
        </div>

    </div>
</template>

<script>
    import postMixin from '../../mixins/post_mixin'
    import Comments from '../comments/comment_index'
    import CommentCreate from '../comments/comment_create'


    export default {
        components: {Comments, CommentCreate},
        name: 'post',
        mixins: [postMixin],
        data() {
            return {
                post: [],
                comments: []
            }
        },
        created() {
            // console.log(this.$can('destroy', 'Comment', { user_id:1 }))
            console.log(this.$ability.rules)
            this.$axios.get('/posts/'+this.$route.params.id)
                .then(response => {
                    this.post = response.data.post
                    this.comments = response.data.comments
                })
        },
    }

</script>

<style scoped>

</style>