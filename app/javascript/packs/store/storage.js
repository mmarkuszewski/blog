//szyfrowanie localStorage
import SecureLS from 'secure-ls'
let ls = new SecureLS();

export default (options) => (store) => {
    if (localStorage.state) {
        const storedState = ls.get('state')
        store.replaceState(Object.assign(store.state, storedState))
    }

    return store.subscribe((mutation, state) => {
        if (options.destroyOn && options.destroyOn.indexOf(mutation.type) !== -1) {
            return ls.remove('state')
        }

        const newState = options.storedKeys.reduce((map, key) => {
            map[key] = state[key]
            return map
        }, {})

        ls.set('state',newState)
    })
}