import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Posts from '../components/posts/post_index'
import App from '../components/app'
import axios from 'axios';
import router from './router'
import Router from "vue-router";
Vue.use(Router)

import Vuex from 'vuex'
Vue.use(Vuex)

import VueFlashMessage from 'vue-flash-message';
require('vue-flash-message/dist/vue-flash-message.min.css');
Vue.use(VueFlashMessage);

import { store, ability } from './store'
import { abilitiesPlugin } from '@casl/vue'
Vue.use(abilitiesPlugin, ability)

import { Can } from '@casl/vue'

Vue.component('Can', Can)

Vue.prototype.$axios = axios
Vue.use(TurbolinksAdapter)
Vue.config.productionTip = false


document.addEventListener('turbolinks:load', () => {
    axios.defaults.headers.common['Accept'] = 'application/json'
    const app = new Vue({
        el: '#app',
        store,
        router: router,
        components: { App },
        template: '<App/>'
    })
})

