const express = require('express')
const models = require('../plugins/models')

const router = express.Router()


const logMsg = (msg) => `[Videos Router] ${error}`


const Plugins = {
    getVideoWithId: async (req, res, next) => {
        try {
            const id = req.params.id

            const video = await models.Video.findOne({ _id: id })
            if (!video || video._id === undefined) {
                return res.status(404).json({ msg: logMsg('Video not fount') })
            }


            res.video = video

        } catch (error) {
            console.log(logMsg(error))
            return res.status(500).json({ msg: logMsg(error) })
        }

        next()
    },

    getVideosByUserId: async (req, res, next) => {
        try {
            const userId = req.params.id

            const videos = await models.Video.find({ publisher: userId })
            if (!videos || videos.length === 0) {
                return res.status(404).json({ msg: logMsg('User has no videos') })
            }


            res.videos = videos

        } catch (error) {
            console.log(logMsg(error))
            return res.status(500).json({ msg: logMsg(error) })
        }

        next()
    }
}




router.get('/', async (req, res) => {
    try {
        const videos = await models.Video.find({})
        if (!videos) {
            return res.status(404).json({ msg: logMsg('video not fount') })
        }


        return res.status(200).json({ videos: videos })

    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})





router.get('/userId=:id', Plugins.getVideosByUserId, (req, res) => {
    return res.status(200).json({ videos: res.videos })
})



router.get('/id=:id', Plugins.getVideoWithId, (req, res) => {
    return res.status(200).json({ video: res.video })
})


router.post('/', async (req, res) => {
    try {
        const { title, desc, book, ph, category, parts, publisher } = req.body

        let video = models.Video({
            title: title, desc: desc, book: book,
            ph: ph, category: category, parts: parts, publisher: publisher,
            likers: [], comments: [], publishedIn: Date.now()
        })
        video = await video.save()

        return res.status(201).json({
            videoId: video._id, video: video
        })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})


router.patch('/id=:id', Plugins.getVideoWithId, async (req, res) => {
    try {
        const {
            title, desc, book, ph, category, parts, comments
        } = req.body
        res.video.title = res.video.title !== title && title !== undefined ? title : res.video.title
        res.video.desc = res.video.desc !== desc && desc !== undefined ? desc : res.video.desc
        res.video.book = res.video.book !== book && book !== undefined ? book : res.video.book
        res.video.ph = res.video.ph !== ph && ph !== undefined ? ph : res.video.ph
        res.video.category = res.video.category !== category && category !== undefined ? category : res.video.category
        res.video.parts = res.video.parts !== parts && parts !== undefined ? parts : res.video.parts
        res.video.comments = res.video.comments !== comments && comments !== undefined ? comments : res.video.comments


        await res.video.save()
        if (!(res.video)) {
            return res.status(500).json({ msg: logMsg('Can\'t save video') })
        }

        return res.status(200).json({ newVideoData: res.video })

    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})



router.delete('/id=:id', Plugins.getVideoWithId, async (req, res) => {
    try {
        await res.video.delete()
        return res.status(200)

    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})

module.exports = router
