<template>
    <!-- Blog Post -->
    <div class="card mb-4">
        <div class="card-body">
            <h2 class="card-title">{{ post.title }}</h2>
            <img v-if="post.picture_data" width="100%" :src=pictureUrl()>
            <p class="card-text">{{ post.content }}</p>
        </div>
        <div class="card-footer text-muted">
            <a v-on:click="getPost" class="btn btn-primary" href="">Read more</a>
        </div>
    </div>
</template>

<script>


    export default {
        name: "post",
        props: ["post"],
        data: function () {
            return {

            }
        },
        methods: {
          getPost: function () {
              this.$axios.get('/posts/' + this.post.id)
                  .then(response => Turbolinks.visit('/posts/' + this.post.id))

          },
            pictureUrl: function() {
                let picture_data = JSON.parse(this.post.picture_data)
                return "/uploads/" + picture_data.storage + "/" + picture_data.id
          }
        },
    }
</script>

<style scoped>

</style>