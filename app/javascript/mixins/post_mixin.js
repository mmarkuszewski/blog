export default {
    methods: {
        pictureUrl: function(post) {
            let picture_data = JSON.parse(post.picture_data)
            return "/uploads/" + picture_data.storage + "/" + picture_data.id
        }
    },
}