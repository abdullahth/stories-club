const express = require('express')

const router = express.Router()
const Models = require('../plugins/models.js')

const logMsg = (msg) => `[Validation Router] ${msg}`


router.get('/emailUniquness/:email', async (req, res) => {
    try {
        const email = req.params.email
        console.log(email)
        const existedUsersAccounts = await Models.User.find({ email: email })
        if (existedUsersAccounts.length > 0) {
            return res.status(200).json({ msg: logMsg('Email already existed') })
        }

        console.log(true)
        return res.status(404).json({ msg: logMsg('Email not existed') })
    } catch (error) {
        return res.status(500).json({ msg: logMsg(`${error}`) })

    }
})


router.get('/emailVerificationCode/:email', async (req, res) => {
    try {
        const code = `${Math.floor((Math.random() * 10) + 1)}${Math.floor((Math.random() * 10) + 1)}${Math.floor((Math.random() * 10) + 1)}${Math.floor((Math.random() * 10) + 1)}`.substring(0, 4)
        console.log(code)

        const emailing = require('../plugins/email')
        msg = emailing.sendCodeEmail(req.params.email, code)
        return res.status(200).json({
            verificationCode: code,
        })
    } catch (error) {
        console.log(logMsg(`${error}`))
        return res.status(500)
    }
})


module.exports = router