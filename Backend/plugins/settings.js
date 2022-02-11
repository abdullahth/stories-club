const express = require('express')
const bodyParser = require('body-parser')

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



	application.use(express.json())
	application.use(bodyParser())

}
