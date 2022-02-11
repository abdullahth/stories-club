const mongoose = require('mongoose')

module.exports = mongoose.model('PublishingHouse', mongoose.Schema({
    name: {
        type: String, required: true
    },
    desc: {
        type: String, required: true
    },
    establishedIn: {
        type: Date, required: true,
    },
    joinedIn: {
        type: Date, required: true, default: Date.now()
    },
    writers: {
        type: Array, required: true, defualt: []
    },
    publishes: {
        type: Array, required: true, defualt: []
    },
}))
