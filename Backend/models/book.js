const mongoose = require('mongoose')

module.exports = mongoose.model('Book', mongoose.Schema({
    title: {
        type: String, required: true
    },
    desc: {
        type: String, required: true
    },
    publisher: {
        type: String, required: true
    },
    depositNumber: {
        type: String,
    },
    ph: {
        type: String, required: true
    },
    numOfChapters: {
        type: Number, required: true
    },
    category: {
        type: Number, required: true
    },
    isin: {
        type: Number, required: true, unique: true
    },
    publishingDate: {
        type: Date, required: true, default: Date.now()
    },
    chapters: {
        type: Array, required: true
    },
    likers: {
        type: [], required: true, default: []
    },
    comment: {
        type: [], required: true, default: []
    }
}))
