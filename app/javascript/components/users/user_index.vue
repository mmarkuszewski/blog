<template>
    <div class="container">

        <div class="col-10">
            <button @click="prevPage">
                Previous
            </button>
            <button @click="nextPage">
                Next
            </button>

            <div v-for="user in users">
                <div class="card mb-4">
                    <div class="card-body">
                        <h2 class="card-title">{{user.email}}</h2>
                    </div>
                    <div class="card-footer text-muted">
                        <a href='#' class="btn btn-primary" @click="deleteUser(user.id)">Delete</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

</template>

<script>
    import userMixin from '../../mixins/user_mixin'
    import pagination from '../../mixins/pagination_mixin'

    export default {
        name: "users_index",
        mixins: [userMixin, pagination],
        data() {
            return {
                users: [],
            }
        },
        created() {
            this.getUsers()
        },
        watch: {
            pageNum: function(){
                this.getUsers()
            }
        },
        methods:{
            getUsers: function(){
                this.$axios.get('/admin/users.json', {
                    params: {
                        page: this.pageNum
                    }
                }).then(response => {
                    this.users = response.data
                }).catch(e => {
                    console.log(e.response)
                })
            },
            deleteUser: function(id){
                console.log(id)
                this.$axios.delete('/admin/users/' + id + '.json',
                    {
                        headers: {
                            'X-CSRF-Token': document
                                .querySelector('meta[name="csrf-token"]')
                                .getAttribute('content')
                        }
                    }).then(response => {
                        this.flashSuccess('User deleted',{
                            timeout: 3000,
                        });
                    }).catch(e => {
                        this.flashError('Error',{
                            timeout: 3000,
                        });
                    })
            }

        }
    }
</script>

<style scoped>

</style>