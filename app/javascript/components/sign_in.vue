<template>
    <div align="center">

        <div class="col-4">

            <h2>Log in</h2>

            <form v-on:submit.prevent="onSubmit">
                <input v-model="email">
                <input v-model="password">
                {{email}}
                {{password}}
                <input type="submit" value="Sign in">
            </form>

            <%= form_for(resource, as: resource_name, url: session_path(resource_name)) do |f| %>
            <div class="field">
                <%= f.label :email %><br />
                <%= f.email_field :email, autofocus: true, autocomplete: "email", class: 'form-control' %>
            </div>

            <div class="field">
                <%= f.label :password %><br />
                <%= f.password_field :password, autocomplete: "current-password", class: 'form-control' %>
            </div>

            <% if devise_mapping.rememberable? %>
            <div class="field">
                <%= f.check_box :remember_me %>
                <%= f.label :remember_me %>
            </div>
            <% end %>

            <div class="actions">
                <%= f.submit "Log in", class: "btn btn-primary" %>
            </div>
            <% end %>

            <%= render "devise/shared/links" %>

        </div>

    </div>
</template>

<script>
    export default {
        name: "sign_in",
        data() {
            return {
                email: "zxc@zxc.zxc",
                password: "zxczxc"
            }
        },
        methods: {
            onSubmit: function(){
                this.$axios.post('/users/sign_in.json',{
                    user: {
                        email: this.email,
                        password: this.password
                    }},
                    {
                        headers: {
                            'X-CSRF-Token': document
                                .querySelector('meta[name="csrf-token"]')
                                .getAttribute('content')
                        }
                    })
                    .then(response => {
                        console.log(response)
                        this.$store.commit('changeUser', response.data.email)
                        document.querySelector('meta[name="csrf-token"]').setAttribute('content', response.headers.csrf)
                        this.$router.replace('/')
                    })
                    .catch(e => {
                        this.error.push(e)
                    })
            }
        }
    }
</script>

<style scoped>

</style>