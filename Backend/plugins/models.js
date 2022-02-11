const bookModel = require('../models/book')
const audioModel = require('../models/audio')
const videoModel = require('../models/video')
const userModel = require('../models/user')
const phModel = require('../models/ph')


module.exports = {
    User: userModel,
    Book: bookModel,
    Audio: audioModel,
    Video: videoModel,
    PH: phModel
}

