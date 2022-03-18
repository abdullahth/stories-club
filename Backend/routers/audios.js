const express = require('express')
const models = require('../plugins/models')
const Images = require('../plugins/images')
const Assets = require('../plugins/assets')
const router = express.Router()
const logMsg = (msg) => `[Audios Router] ${msg}`
const fs = require('fs')
const base64ToImage = require('base64-to-image')
const base64ToFile = require('base64-to-file')


const multer = require('multer')
const storage = multer.diskStorage({
    destination: (req, file, cb) => {
	console.log(file.filename)
        cb(null, "./assetsDatabase/audios/")
    },
    filename: (req, file, cb) => {
	console.log(file.filename)
        cb(null, `${file.originalname}`)
    }
})

const upload = multer({ storage: storage })

const Plugins = {
    getAudioWithId: async (req, res, next) => {
        try {
            const id = req.params.id

            const audio = await models.Audio.findOne({ _id: id })
            if (!audio || audio._id === undefined) {
                return res.status(404).json({ msg: logMsg('Audio not fount') })
            }


            res.audio = audio

        } catch (error) {
            console.log(logMsg(error))
            return res.status(500).json({ msg: logMsg(error) })
        }

        next()
    },

    getAudiosByUserId: async (req, res, next) => {
        try {
            const userId = req.params.id

            const audios = await models.Audio.find({ publisher: userId })
            if (!audios || audios.length === 0) {
                return res.status(404).json({ msg: logMsg('User has no audios') })
            }


            res.audios = audios

        } catch (error) {
            console.log(logMsg(error))
            return res.status(500).json({ msg: logMsg(error) })
        }

        next()
    }
}


router.post('/:id/assets/upload', async function (req, res) {
    try {
        const filename = req.body.filename
        const base64url = req.body.base64url
        fs.writeFile(`./assetsDatabase/audios/assets/${filename}`, base64url, { encoding: 'base64' }, () => console.log('Create'))

        return res.status(200).json({ msg: logMsg('Uploaded') })

    } catch (error) {
        console.log(error)
        return res.status(500)
    }

})



router.post('/:id/images/cover', async function (req, res) {
    try {
        const filename = req.body.filename
        const base64url = req.body.base64url
        fs.writeFile(`./assetsDatabase/audios/covers/${filename}`, base64url, { encoding: 'base64' }, () => console.log('Create'))

        return res.status(200).json({ msg: logMsg('Uploaded') })

    } catch (error) {
        console.log(error)
        return res.status(500)
    }

})


router.get('/asset/:id', async (req, res) => {
    try {

        const _file = Assets.getAssetByFilePath('audios', req.params.id)
        console.log(_file)

        res.set({
            'content-type': "image/jpg",
        })
        res.sendFile(_file.path, _file.options)
    } catch (e) {
        console.log(`${e}`)
        return res.status(404).json({ msg: logMsg(`Image Not found!`) })
    }
})


router.get('/covers/:id', async (req, res) => {
    try {

        const _file = Images.getImageByFilePath('audios', req.params.id)

        res.set({
            'content-type': "image/jpg",
        })
        res.sendFile(_file.path, _file.options)
    } catch (e) {
        console.log(`${e}`)
        return res.status(404).json({ msg: logMsg(`Image Not found!`) })
    }
})


router.get('/', async (req, res) => {
    try {
        const audios = await models.Audio.find({}).sort({ likers: -1 })
        if (!audios) {
            return res.status(404).json({ msg: logMsg('Audio not fount') })
        }


        return res.status(200).json({ audios: audios })

    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})



router.get('/userId=:id', Plugins.getAudiosByUserId, (req, res) => {
    return res.status(200).json({ audios: res.audios })
})



router.get('/id=:id', Plugins.getAudioWithId, (req, res) => {
    return res.status(200).json({ audio: res.audio })
})


router.post('/', async (req, res) => {
    try {
        console.log(req.body)
        const { title, desc, book, ph, category, parts, publisher } = req.body

        let audio = models.Audio({
            title: title, desc: desc, book: book,
            ph: ph, category: category, parts: parts, publisher: publisher,
            likers: [], comments: [], publishedIn: Date.now()
        })
        audio = await audio.save()

        console.log(audio._id)
        return res.status(201).json({
            audioId: audio._id, audio: audio
        })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})


router.patch('/id=:id', Plugins.getAudioWithId, async (req, res) => {
    try {
        const {
            title, desc, book, ph, category, parts, comments
        } = req.body
        res.audio.title = res.audio.title !== title && title !== undefined ? title : res.audio.title
        res.audio.desc = res.audio.desc !== desc && desc !== undefined ? desc : res.audio.desc
        res.audio.book = res.audio.book !== book && book !== undefined ? book : res.audio.book
        res.audio.ph = res.audio.ph !== ph && ph !== undefined ? ph : res.audio.ph
        res.audio.category = res.audio.category !== category && category !== undefined ? category : res.audio.category
        res.audio.parts = res.audio.parts !== parts && parts !== undefined ? parts : res.audio.parts
        res.audio.comments = res.audio.comments !== comments && comments !== undefined ? comments : res.audio.comments


        await res.audio.save()
        if (!(res.audio)) {
            return res.status(500).json({ msg: logMsg('Can\'t save audio') })
        }

        return res.status(200).json({ newAudioData: res.audio })

    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})



router.delete('/id=:id', Plugins.getAudioWithId, async (req, res) => {
    try {
        await res.audio.delete()
        return res.status(200)

    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})


module.exports = router
