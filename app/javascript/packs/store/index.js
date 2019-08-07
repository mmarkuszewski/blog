import Vue from 'vue'
import Vuex from 'vuex'
import storage from './storage'
import { abilityPlugin, ability as appAbility } from './ability'

Vue.use(Vuex)

export const ability = appAbility

export const store = new Vuex.Store({
    plugins: [
        storage({
            storedKeys: ['rules', 'current_user'],
        }),
        abilityPlugin
    ],
    state: {
        current_user: null,
        rules: [],
    },
    mutations: {
        changeRules(state, rules) {
            state.rules = rules
        },
        changeUser (state, user) {
            state.current_user = user
        }
    },
})