const mongoose = require('mongoose')

module.exports = mongoose.model('Audio', mongoose.Schema({
    title: {
        type: String, required: true
    },
    desc: {
        type: String, required: true
    },
    publisher: {
        type: String, required: true
    },
	book:String,
	ph: String,
    publishedIn: {
        type: Date, required: true, default: Date.now()
    },
    category: {
        type: Number, required: true
    },
    parts: {
        type: [], required: true,
    },
    likers: {
        type: Array, required: true, default: []
    },
    comments: {
        type: Array, required: true, default: []
    }
}))
