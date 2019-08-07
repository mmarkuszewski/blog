import Vue from 'vue'
import Router from 'vue-router'
import Post from '../../components/posts/post_show'
import Posts from '../../components/posts/post_index'
import EditPost from '../../components/posts/post_edit'
import Signin from '../../components/users/sign_in'
import CreatePost from '../../components/posts/post_create'
import Users from '../../components/users/user_index'
import RegisterUser from '../../components/users/user_registration'
import EditUser from '../../components/users/user_edit'

export default new Router ({
    routes: [
        {
            path: '/',
            component: Posts
        },
        {
            path: '/posts/:id',
            name: 'post',
            component: Post
        },
        {
            path: '/posts/edit/:id',
            name: 'edit_post',
            component: EditPost
        },
        {
            path: '/users/sign_in',
            name: 'sign_in',
            component: Signin
        },
        {
            path: '/post/new',
            name: 'create_post',
            component: CreatePost
        },
        {
            path: '/users/sign_out',
            name: 'sign_out',
        },
        {
            path: '/users',
            name: 'users',
            component: Users
        },
        {
            path: '/register',
            name: 'register',
            component: RegisterUser
        },
        {
            path: '/user/edit',
            name: 'edit_user',
            component: EditUser
        },
        ]
})