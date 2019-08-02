<template>
    <div>
        <div class="container">
            <div class="col-10">
                <!-- Blog Post -->
                <div v-for="post in posts">
                    <div class="card mb-4">
                        <div class="card-body">
                            <h2 class="card-title">{{ post.title }}</h2>
                            <img v-if="post.picture_data" width="100%" :src=pictureUrl(post)>
                            <p class="card-text">{{ post.content }}</p>
                        </div>
                        <div class="card-footer text-muted">
                            <router-link class="btn btn-primary" href="" :to="{ name: 'post', params: {id: post.id } }">Read more</router-link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</template>

<script>
    import postMixin from '../../mixins/post_mixin'

    export default {
        mixins: [postMixin],
        name: "posts",
        data() {
            return {
                posts: []
            }
        },
        created() {
                this.$axios.get('/posts.json')
                    .then(response => {
                        this.posts = response.data
                    })
                    .catch(e => {
                        this.error.push(e)
                    })
        }
    }
</script>

<style scoped>

</style>