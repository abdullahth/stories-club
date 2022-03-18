const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')


module.exports = (application) => {
    // Cors Handling
    application.use((req, res, next) => {
        res.header("Access-Control-Allow-Origin", "*")
	res.header("Access-Control-Allow-Headers", "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale")
//        res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept, Authorization")

        if (req.method === 'OPTIONS') {
            res.header('Access-Control-Allow-Methods', 'PUT, POST, PATCH, DELETE, GET')
        }

        next()
    })

	application.use(cors())
	application.use("*", cors())
	application.use(express.json({ limit: '250mb' }))
	application.use(bodyParser.json({ limit: '250mb' }))
	application.use(bodyParser.json({
		limit: '250mb',
		extended: true, 
	}))
	application.use(bodyParser.text({ limit: '250mb' }))

}
