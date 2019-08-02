<template>
    <div id="app">
        <div v-if="current_user">currentuser:{{ current_user }}</div>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <router-link to="/" class="nav-link">Home</router-link>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" v-on:click="signOut">Logout</a>
                        </li>
                        <% if current_user %>
                        <li class="nav-item">
                            <%= link_to current_user.email, edit_user_registration_path, class: "nav-link" %>
                        </li>
                        <% if can? :index, User %>
                        <li class="nav-item">
                            <%= link_to "Manage users", admin_users_path, class: "nav-link" %>
                        </li>
                        <% end %>
                        <% if can? :create, Post %>
                        <%= link_to "Create post", new_admin_post_path, class: "nav-link" %>
                        <% end %>
                        <li class="nav-item">
                            <%= link_to 'Logout', destroy_user_session_path, method: :delete, class: "nav-link" %>
                        </li>
                        <%else %>
                        <li class="nav-item">
                            <router-link to="/users/sign_in" class="nav-link">Login</router-link>

                            <!--                            <%= link_to 'Login', new_user_session_path, class: "nav-link" %>-->
                        </li>
                        <% end %>
                    </ul>
                </div>
            </div>
        </nav>
        <router-view></router-view>
    </div>

</template>

<script>
    export default {

        name: "App",
        data() {
            return {
            }
        },
        computed: {
            current_user () {
                return this.$store.state.current_user
            }
        },
        methods: {
            signOut: function () {

                this.$axios.delete("/users/sign_out", {
                    headers :{'X-CSRF-Token' : document
                        .querySelector('meta[name="csrf-token"]')
                        .getAttribute('content')}
                })
                    .then(response => {
                        this.$store.commit('changeUser', null)
                        console.log(response)
                        document.querySelector('meta[name="csrf-token"]').setAttribute('content', response.headers.csrf)
                        this.$router.replace('/')
                    })
                    .catch(e => {
                        this.error.push(e)
                    })
            }
        },
    }
</script>

<style scoped>

</style>