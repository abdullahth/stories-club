const express = require('express')
const models = require('../plugins/models')
const router = express.Router()
const Images = require('../plugins/images')
const Assets = require('../plugins/assets')

const logMsg = (msg) => `[Books Router] ${msg}`
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
    getBookWithId: async (req, res, next) => {
        try {
            const id = req.params.id

            const book = await models.Book.findOne({ _id: id })
            if (!book || book._id === undefined) {
                return res.status(404).json({ msg: logMsg('Book not fount') })
            }


            res.book = book

        } catch (error) {
            console.log(logMsg(error))
            return res.status(500).json({ msg: logMsg(error) })
        }

        next()
    },

    getBooksByUserId: async (req, res, next) => {
        try {
            const userId = req.params.id

            const books = await models.Book.find({ publisher: userId })
            if (!books || books.length === 0) {
                return res.status(404).json({ msg: logMsg('User has no books') })
            }


            res.books = books

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
        fs.writeFile(`./assetsDatabase/books/assets/${filename}`, base64url, { encoding: 'base64' }, () => console.log('Create'))

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
        fs.writeFile(`./assetsDatabase/books/covers/${filename}`, base64url, { encoding: 'base64' }, () => console.log('Create'))

        return res.status(200).json({ msg: logMsg('Uploaded') })

    } catch (error) {
        console.log(error)
        return res.status(500)
    }

})


router.get('/asset/:id', async (req, res) => {
    try {

        const _file = Assets.getAssetByFilePath('books',  req.params.id)
        console.log(_file)

        res.set({
            'content-type': "application/pdf",
        })
        res.sendFile(_file.path, _file.options)
    } catch (e) {
        console.log(`${e}`)
        return res.status(404).json({ msg: logMsg(`Image Not found!`) })
    }
})



router.get('/covers/:id', async (req, res) => {
    try {
	console.log(req.params.id)
        const _file = Images.getImageByFilePath('books',  req.params.id)

        res.set({
            'content-type': "image/jpg",
        })
        res.sendFile(_file.path, _file.options)
    } catch (e) {
        console.log(`${e}`)
        return res.status(404).json({ msg: logMsg(`Image Not found!`) })
    }
})




router.get('/userId=:id', Plugins.getBooksByUserId, (req, res) => {
    return res.status(200).json({ books: res.books })
})



router.get('/', async (req, res) => {
    try {
        const books = await models.Book.find({}).sort({ likers: -1 })
        if (!books) {
            return res.status(404).json({ msg: logMsg('Book not fount') })
        }


	console.log(books.length)
        return res.status(200).json({ books: books })

    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})





router.get('/id=:id', Plugins.getBookWithId, (req, res) => {
    return res.status(200).json({ book: res.book })
})


router.post('/', async (req, res) => {
    try {
        const { title, desc, ph, publisher, depositNumber, isin, category } = JSON.parse(req.body)

        let book = models.Book({
            title: title, desc: desc,
            ph: ph, category: category, publisher: publisher,
            likers: [], comments: [], publishingDate: Date.now(), depositNumber: depositNumber, isin: isin
        })
        book = await book.save()

        return res.status(201).json({
            bookId: book._id, book: book
        })
    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})


router.patch('/id=:id', Plugins.getBookWithId, async (req, res) => {
    try {
        const { title, desc, ph, chapters, depositNumber, category, isin } = req.body
        res.book.title = res.book.title !== title && title !== undefined ? title : res.book.title
        res.book.desc = res.book.desc !== desc && desc !== undefined ? desc : res.book.desc
        res.book.ph = res.book.ph !== ph && ph !== undefined ? ph : res.book.ph
        res.book.chapters = res.book.chapters !== chapters && chapters !== undefined ? chapters : res.book.chapters
        res.book.depositNumber = res.book.depositNumber !== depositNumber && depositNumber !== undefined ? depositNumber : res.book.depositNumber
        res.book.isin = res.book.isin !== isin && isin !== undefined ? isin : res.book.isin
        res.book.category = res.book.category !== category && category !== undefined ? category : res.book.category


        await res.book.save()
        if (!(res.book)) {
            return res.status(500).json({ msg: logMsg('Can\'t save book') })
        }

        return res.status(200).json({ newBookData: res.book })

    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})



router.delete('/id=:id', Plugins.getBookWithId, async (req, res) => {
    try {
        await res.book.delete()
        return res.status(200)

    } catch (error) {
        console.log(error)
        return res.status(500).json({ msg: logMsg(error) })
    }
})



module.exports = router
