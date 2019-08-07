import { Ability } from '@casl/ability'

export const ability = new Ability()

export const abilityPlugin = (store) => {
    ability.update(store.state.rules)

    return store.subscribe((mutation) => {
        switch (mutation.type) {
            case 'changeRules':
                ability.update(mutation.payload)
                break
        }
    })
}