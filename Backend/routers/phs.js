const express = require('express')
const { model } = require('mongoose')
const models = require('../plugins/models')

const logMsg = (msg) => `[Publishing House Router] ${error}`
const router = express.Router()


const Plugins = {
    getPHById: async (req, res, next) => {
        try {
            const id = req.params.id
            const ph = await models.PH.findOne({ _id: id })

            if (!ph) {
                res.status(404).json({ msg: logMsg('Publishing House is not founded') })
            }

            res.ph = ph
        } catch (error) {
            console.log(logMsg(error))
            return res.status(500).json({ msg: logMsg(error) })
        }
        next()
    },

}



router.get('/:id', async (req, res) => {
    return res.status(200).json({ ph: req.ph })
})


router.post('/', async (req, res) => {
    try {
        const { name, desc, establishedIn, writers, publishers } = req.body

        let ph = models.PH({ name: name, desc: desc, establishedIn, writers: writers, publishers: publishers })
        ph = await ph.save()

        return res.status(201).json({ newPHId: ph._id, ph: ph })
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })

    }

})


router.patch('/:id', Plugins.getPHById, async (req, res) => {
    try {

        const { name, desc, establishedIn, writers, publishers } = req.body
        res.ph.name = res.ph.name !== name && name !== undefined ? name : res.ph.name
        res.ph.desc = res.ph.desc !== desc && desc !== undefined ? desc : res.ph.desc
        res.ph.establishedIn = res.ph.establishedIn !== establishedIn && establishedIn !== undefined ? establishedIn : res.ph.establishedIn
        res.ph.writers = res.ph.writers !== writers && writers !== undefined ? writers : res.ph.writers
        res.ph.publishers = res.ph.publishers !== publishers && publishers !== undefined ? publishers : res.ph.publishers


        await res.ph.save()
        return res.status(200).json({ newPHData: res.ph })
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})

router.delete('/:id', Plugins.getPHById, async (req, res) => {
    try {
        await res.ph.delete()
        return res.status(200)
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})




module.exports = router
