const express = require('express')
const { model } = require('mongoose')
const models = require('../plugins/models')

const logMsg = (msg) => `[users Router] ${msg}`
const router = express.Router()



const Plugins = {
    getUserById: async (req, res, next) => {
        try {
            const id = req.params.id
            const user = await models.User.findOne({ _id: id })

            if (!user) {
                res.status(404).json({ msg: logMsg('User is not founded') })
            }

            res.user = user
        } catch (error) {
            console.log(logMsg(error))
            return res.status(500).json({ msg: logMsg(error) })
        }
        next()
    },

    getUserByEmail: async (req, res, next) => {
        try {
            const email = req.params.email
            const user = await models.User.findOne({ email: email })

            if (!user) {
                res.status(404).json({ msg: logMsg('User is not founded') })
            }

            res.user = user
        } catch (error) {
            console.log(logMsg(error))
            return res.status(500).json({ msg: logMsg(error) })
        }
        next()
    },


}



router.get('/', async (req, res) => {
    try {
        const users = await models.User.find({})
        for (let user in users) {
            console.log(user.log)
        }

        if (!users) {
            res.status(404).json({ msg: logMsg('User is not founded') })
        }

        return res.status(200).json({ users: users })
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }

})



router.get('/id=:id', Plugins.getUserById, async (req, res) => {
    return res.status(200).json({ user: res.user })
})




router.get('/email=:email', Plugins.getUserByEmail, async (req, res) => {
    return res.status(200).json({ user: res.user })
})



router.post('/', async (req, res) => {
    try {
        const { name, email, password, phoneNumber, withdrawlBankAccount, withdrawlPhoneWallet, gender, cityCode } = req.body

        let user = models.User({
            name: name, email: email, password: password, phoneNumber: phoneNumber,
            withdrawlBankAccount: "", withdrawlPhoneWallet: "",
            verified: false, log: {}, joinedIn: Date.now(), withdrawlRequests: [],
            gender: gender, cityCode: cityCode


        })
        user = await user.save()

        return res.status(201).json({ newUserId: user._id, user: user })
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })

    }

})


router.patch('/:id', Plugins.getUserById, async (req, res) => {
    try {

        const { name, email, password, phoneNumber, withdrawlBankAccount, withdrawlPhoneWallet } = req.body
        res.user.name = res.user.name !== name && name !== undefined ? name : res.user.name
        res.user.email = res.user.email !== email && email !== undefined ? email : res.user.email
        res.user.password = res.user.password !== password && password !== undefined ? password : res.user.password
        res.user.phoneNumber = res.user.phoneNumber !== phoneNumber && phoneNumber !== undefined ? phoneNumber : res.user.phoneNumber
        res.user.withdrawlBankAccount = res.user.withdrawlBankAccount !== withdrawlBankAccount && withdrawlBankAccount !== undefined ? withdrawlBankAccount : res.user.withdrawlBankAccount
        res.user.withdrawlPhoneWallet = res.user.withdrawlPhoneWallet !== withdrawlPhoneWallet && withdrawlPhoneWallet !== undefined ? withdrawlPhoneWallet : res.user.withdrawlPhoneWallet


        await res.user.save()
        return res.status(200).json({ newUserData: res.user })
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})

router.patch('/verify/:id', Plugins.getUserById, async (req, res) => {
    try {
        res.user.verified = true
        await res.user.save()

        return res.status(200)
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})

router.patch('/unverify/:id', Plugins.getUserById, async (req, res) => {
    try {
        res.user.verified = false
        await res.user.save()

        return res.status(200)
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})

router.delete('/:id', Plugins.getUserById, async (req, res) => {
    try {
        await res.user.delete()
        return res.status(200)
    } catch (error) {
        console.log(logMsg(error))
        return res.status(500).json({ msg: logMsg(error) })
    }
})




module.exports = router
