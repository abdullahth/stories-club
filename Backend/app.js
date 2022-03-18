// Modules

// EndPoints Application
const express = require('express')
// Database Configrations
const mongoose = require('mongoose')
// Images Handling
const multer = require('multer')
// Emailing Management
const nodemailer = require('nodemailer')
// ENV Vars
const config = require('./config')

// Plugins
const routerRegistration = require('./plugins/routerReg')

const application = express()

// Register Plugins
const settingsInitialization = require('./plugins/settings')
settingsInitialization(application)

// Register Routes
routerRegistration(application)

// Models
const Models = require('./plugins/models')


// Database Init
mongoose.connect(config.dbUrl, { useUnifiedTopology: true, useNewUrlParser: true })
const db = mongoose.connection
db.once('open', () => console.log(`\n\n[MongoDB] Database Initialized Successfully`))
db.on('error', (error) => console.log(`[MongoDB] ${error}`))



application.listen(config.port, () => console.log(`\n\n[Server] Server Initialized Successfully\n[Server] Server is listenning on http://${config.host}:${config.port}/`))
