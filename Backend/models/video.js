const mongoose = require('mongoose')

module.exports = mongoose.model('Video', mongoose.Schema({
    title: {
        type: String, required: true
    },
    desc: {
        type: String, required: true
    },
    publisher: {
        type: String, required: true
    },
    book: {
        type: String, required: true
    },
    ref: {
        type: String, required: true,
    },
    ph: {
        type: String, required: true
    },
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
    },
}))
