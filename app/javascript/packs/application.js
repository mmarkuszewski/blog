import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import Post from '../components/post.vue'
import axios from 'axios';

Vue.prototype.$axios = axios
Vue.use(TurbolinksAdapter)
Vue.config.productionTip = false

document.addEventListener('turbolinks:load', () => {
    const app = new Vue({
        el: '#app',
        components: { Post }
    })
})

