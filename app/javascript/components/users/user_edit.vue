<template>
    <div align="center">

        <div class="col-4">

            <h2>Change {{$store.state.current_user}}'s password</h2>

            <form v-on:submit.prevent="onSubmit">
                <label>Email:</label>
                <input v-model="email" disabled>
                <label>Password:</label>
                <input v-model="password">
                <label>Confirm password:</label>
                <input v-model="password_confirmation">
                <label>Current password:</label>
                <input v-model="current_password">
                <input type="submit" value="Change password">
            </form>

        </div>
    </div>
</template>

<script>
    import userMixin from '../../mixins/user_mixin'

    export default {
        name: "users_edit",
        mixins: [userMixin],
        data() {
            return {
                email: this.$store.state.current_user,
                password: null,
                password_confirmation: null,
                current_password: null
            }
        },
        methods: {
            onSubmit: function(){
                this.$axios.patch('/users',
                    {
                        user: {
                            email: this.email,
                            password: this.password,
                            password_confirmation: this.password_confirmation,
                            current_password: this.current_password
                        }
                    },
                    {
                        headers: {
                            'X-CSRF-Token': document
                                .querySelector('meta[name="csrf-token"]')
                                .getAttribute('content')
                        }
                    }
                ).then(response => {
                    console.log(response)
                    this.flashSuccess('Password changed',{
                        timeout: 3000,
                    });
                }).catch(e => {
                    this.getFlashErrors(e.response)
                })

            }
        }

    }
</script>

<style scoped>

</style>