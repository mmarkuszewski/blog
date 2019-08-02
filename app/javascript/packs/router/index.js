import Vue from 'vue'
import Router from 'vue-router'
import Post from '../../components/posts/post_show'
import Posts from '../../components/posts/post_index'
import Signin from '../../components//sign_in'

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
            path: '/users/sign_in',
            name: 'sign_in',
            component: Signin
        },
        {
            path: '/users/sign_out',
            name: 'sign_out',

        }
        ]
})