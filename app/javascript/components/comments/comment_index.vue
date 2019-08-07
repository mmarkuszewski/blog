<template>
    <div>
        <div v-for="comment in comments" :key="comment.id">
            <div class="media mb-4">
                <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
                <div class="media-body">
                    <h5 class="mt-0">{{comment.user_id}}</h5>
                    <div id="comment<%= comment.id %>">{{ comment.content }}</div>
                </div>
                <Can I="destroy" :this="comment">destroy</Can>
                <div v-if="$can('destroy', 'Comment', '{user_id: comment.user_id}')">
                    delete
                </div>
<!--                <div v-if="$can('destroy', 'Comment')">-->
<!--                    <button class="btn btn-primary" >Delete</button>-->
<!--                </div>-->

<!--                <% if can? :edit, comment %>-->
<!--                <%= link_to "Edit", edit_post_comment_path(id: comment.id, post_id: @post.id) , class: "btn btn-primary", remote: true, id: "comment"+comment.id.to_s %>-->
<!--                <% end %>-->
<!--                <% if can? :destroy, comment %>-->
<!--                <%= link_to "Delete", post_comment_path(id: comment.id, post_id: @post.id), :method => :delete , class: "btn btn-primary" %>-->
<!--                <% end %>-->
            </div>
        </div>
    </div>





<!--        <div v-for="comment in comments">-->
<!--        <div class="media mb-4">-->
<!--            <img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">-->
<!--            <div class="media-body">-->
<!--                <h5 class="mt-0">{{comment.user_id}}</h5>-->
<!--                <div id="comment<%= comment.id %>">{{ comment.content }}</div>-->
<!--            </div>-->


<!--            <% if can? :edit, comment %>-->
<!--            <%= link_to "Edit", edit_post_comment_path(id: comment.id, post_id: @post.id) , class: "btn btn-primary", remote: true, id: "comment"+comment.id.to_s %>-->
<!--            <% end %>-->
<!--            <% if can? :destroy, comment %>-->
<!--            <%= link_to "Delete", post_comment_path(id: comment.id, post_id: @post.id), :method => :delete , class: "btn btn-primary" %>-->
<!--            <% end %>-->
<!--        </div>-->
<!--    </div>-->
</template>

<script>

    export default {
        name: "comments",
        props: ['comments'],
        data() {
            return {
                // comments: [],
            }
        },
    }
</script>

<style scoped>

</style>