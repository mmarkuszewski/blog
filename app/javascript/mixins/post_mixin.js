import MainMixin from './main_mixin'
import Messages from './default_messages_mixin'

export default {
    mixins: [MainMixin, Messages],
    methods: {
        pictureUrl: function(post) {
            let picture_data = JSON.parse(post.picture_data)
            return "/uploads/" + picture_data.storage + "/" + picture_data.id
        },
    },
}