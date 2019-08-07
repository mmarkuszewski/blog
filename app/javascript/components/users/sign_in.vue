<template>
    <div align="center">

        <div class="col-4">

            <h2>Log in</h2>

            <form v-on:submit.prevent="onSubmit">
                <label>Email:</label>
                <input v-model="email">
                <label>Password:</label>
                <input v-model="password">
                <input type="submit" value="Sign in">
            </form>
        </div>

    </div>
</template>

<script>
    import userMixin from '../../mixins/user_mixin'

    export default {
        name: "sign_in",
        mixins: [userMixin],
        data() {
            return {
                email: "asd@vp.pl",
                password: "asdasd"
            }
        },
        mixins: [userMixin],
        methods: {
            onSubmit: function(){
                this.$axios.post('/users/sign_in.json',{
                    user: {
                        email: this.email,
                        password: this.password
                    }},
                    {
                        headers: this.header()
                    })
                    .then(response => {
                        this.$store.commit('changeRules', JSON.parse(response.headers.rules))
                        this.$store.commit('changeUser', response.data)
                        document.querySelector('meta[name="csrf-token"]').setAttribute('content', response.headers.csrf)
                        this.$router.replace('/')
                        this.flashSuccess(response.headers.flash_notice,{
                            timeout: 3000,
                        });
                    })
                    .catch(e => {
                        this.flashError(e.response.data['error'],{
                            timeout: 3000,
                        });
                    })
            }
        }
    }
</script>

<style scoped>

</style>