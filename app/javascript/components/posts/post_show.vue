<template>

    <div class="container">
    {{post}}
        {{comments}}
        <div class="row">
            <div class="col-lg-8">
                <!-- Title -->
                <h1 class="mt-4">{{ post.title }}</h1>
                <img v-if="post.picture_data" width="100%" :src=pictureUrl(post)>

                <!-- Post Content -->
                <p>{{ post.content }}</p>

                <% if can? :edit, @post %>
                <%= link_to "Edit post", edit_admin_post_path(@post.id), class: "btn btn-primary" %>
                <% end %>

                <div v-for="comment in comments">
                    <div class="media mb-4">
                        <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                        <div class="media-body">
                            <h5 class="mt-0">{{comment.user_id}}</h5>
                            <div id="comment<%= comment.id %>">{{ comment.content }}</div>
                        </div>

                        <% if can? :edit, comment %>
                        <%= link_to "Edit", edit_post_comment_path(id: comment.id, post_id: @post.id) , class: "btn btn-primary", remote: true, id: "comment"+comment.id.to_s %>
                        <% end %>
                        <% if can? :destroy, comment %>
                        <%= link_to "Delete", post_comment_path(id: comment.id, post_id: @post.id), :method => :delete , class: "btn btn-primary" %>
                        <% end %>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
    import postMixin from '../../mixins/post_mixin'

    export default {
        name: 'post',
        mixins: [postMixin],
        data() {
            return {
                post: [],
                comments: []
            }
        },
        created() {
            this.$axios.get('/posts/'+this.$route.params.id)
                .then(response => {
                    this.post = response.data.post
                    this.comments = response.data.comments
                })
                .catch(e => {
                    this.error.push(e)
                })
        }
    }

</script>

<style scoped>

</style>