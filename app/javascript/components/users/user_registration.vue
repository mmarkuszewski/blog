<template>
    <div align="center">

        <div class="col-4">

            <h2>Sign up</h2>

            <form v-on:submit.prevent="onSubmit">
                <label>Email:</label>
                <input v-model="email">
                <label>Password:</label>
                <input v-model="password">
                <label>Confirm password:</label>
                <input v-model="password_confirmation">
                <input type="submit" value="Sign up">
            </form>
        </div>

    </div>
</template>

<script>
    import userMixin from '../../mixins/user_mixin'

    export default {
        name: "user_registration",
        mixins: [userMixin],
        data() {
            return {
                email: "asd@vp.pll",
                password: "asdasdl",
                password_confirmation: 'asdasdl'
            }
        },
        methods: {
            onSubmit: function(){
                this.$axios.post('/users.json',{
                        user: {
                            email: this.email,
                            password: this.password,
                            password_confirmation: this.password_confirmation
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
                        // this.$store.commit('changeRules', JSON.parse(response.headers.rules))
                        // this.$store.commit('changeUser', response.data.email)
                        // document.querySelector('meta[name="csrf-token"]').setAttribute('content', response.headers.csrf)
                        this.$router.replace('/')
                        this.flashSuccess('Now you can log in',{
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