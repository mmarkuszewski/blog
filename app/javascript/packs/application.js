import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Posts from '../components/posts/post_index'
import App from '../components/app'
import axios from 'axios';
import router from './router'
import Router from "vue-router";
import Vuex from 'vuex'
Vue.use(Vuex)
Vue.use(Router)

Vue.prototype.$axios = axios
Vue.use(TurbolinksAdapter)
Vue.config.productionTip = false

const store = new Vuex.Store({
    state: {
        current_user: null
    },
    mutations: {
        changeUser (state, user) {
            state.current_user = user
        }
    }
})


document.addEventListener('turbolinks:load', () => {
//     axios.defaults.headers.common['X-CSRF-Token'] = document
//         .querySelector('meta[name="csrf-token"]')
//         .getAttribute('content')
    axios.defaults.headers.common['Accept'] = 'application/json'
    const app = new Vue({
        el: '#app',
        store,
        router: router,
        components: { App },
        template: '<App/>'
    })
})

