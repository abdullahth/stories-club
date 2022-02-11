const e = require('express')
const nodemailer = require('nodemailer')

const transporter = nodemailer.createTransport({
    host: 'smtp.zoho.com',
    port: 465,
    secure: true,
    auth: {
        user: 'noreply@storiesclub.net',
        pass: '27102021-Athena-Backend-Mailing@StroiesClub.Password@Athena Digital Solutions'
    }

})

const emails = {
    sendCodeEmail: (email, code) => {
        transporter.sendMail({
            from: 'noreply@storiesclub.net',
            to: email,
            subject: `Test Email`,
            text: `Hello World Email, Code is ${code}`
        })
    }
}


module.exports = emails