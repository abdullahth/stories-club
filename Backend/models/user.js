const mongoose = require('mongoose')

module.exports = mongoose.model('User', mongoose.Schema({
    name: {
        type: String, required: true
    },
    email: {
        type: String, required: true, unique: true
    },
    password: {
        type: String, required: true,
    },
    phoneNumber: {
        type: String, required: true, unique: true
    },
    withdrawlBankAccount: {
        type: String,  
    },
    withdrawlPhoneWallet: {
        type: String,  
    },
    gender: {
        type: Number, required: true
    },
    cityCode: {
        type: Number, required: true
    },
    publishes: {
        type: Array, required: true, default: []
    },
    withdrawlRequests: {
        type: Array, required: true, defualt: []
    },
    verified: {
        type: Boolean, required: false, default: false
    },
    joinedIn: {
        type: Date, required: true, default: Date.now()
    },
    log: {
        type: Map, required: true
    },

}))
