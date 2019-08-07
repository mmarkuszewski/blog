<template>
    <div id="app">
        <flash-message></flash-message>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <div class="container">
                <router-link to="/" class="navbar-brand">Home</router-link>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto" v-if="$store.state.current_user">
                        <li class="nav-item">
                            <router-link :to="{ name: 'edit_user'}" class="nav-link">{{ $store.state.current_user.email }}</router-link>
                        </li>

                        <div v-if="$can('index', 'User')">
                            <li class="nav-item">
                                <router-link :to="{name: 'users'}" class="nav-link">Manage users</router-link>
                            </li>
                        </div>
                        <div v-if="$can('manage', 'Post')">
                            <router-link :to="{name: 'create_post'}" class="nav-link">Create Post</router-link>
                        </div>

                        <li class="nav-item">
                            <a class="nav-link" @click="signOut">Logout</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav ml-auto" v-else>
                        <li class="nav-item">
                            <router-link :to="{name: 'register'}" class="nav-link">Register</router-link>
                        </li>
                        <li class="nav-item">
                            <router-link :to="{name: 'sign_in'}" class="nav-link">Login</router-link>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <router-view></router-view>
    </div>

</template>

<script>
    import mainMixin from '../mixins/main_mixin'

    export default {
        name: "App",
        mixins: [mainMixin],
        data() {
            return {
            }
        },
        methods: {
            signOut: function () {
                this.$axios.delete("/users/sign_out", {
                    headers : this.header()
                }).then(response => {
                    this.$store.commit('changeRules', JSON.parse(response.headers.rules))
                    this.$store.commit('changeUser', null)
                    document.querySelector('meta[name="csrf-token"]').setAttribute('content', response.headers.csrf)
                    this.$router.replace('/')
                    this.flashSuccess(response.headers.flash_notice,{
                        timeout: 3000,
                    });
                })
            }
        },
        created() {
            console.log(this.$can('read', 'Post'))
        }
    }
</script>

<style scoped>

</style>