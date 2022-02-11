const express = require('express')

module.exports = (expressApp) => {
    const validationRouter = require('../routers/validation')
    expressApp.use('/validation', validationRouter)
    console.log('[Validation Router] Router Registered Successfully')

    const booksRouter = require('../routers/books')
    expressApp.use('/books', booksRouter)
    console.log('[Books Router] Router Registered Successfully')

    const audiosRouter = require('../routers/audios')
    expressApp.use('/audios', audiosRouter)
    console.log('[Audio Router] Router Registered Successfully')

    const videosRouter = require('../routers/videos')
    expressApp.use('/videos', videosRouter)
    console.log('[Video Router] Router Registered Successfully')

    const usersRouter = require('../routers/users')
    expressApp.use('/users', usersRouter)
    console.log('[Users Router] Router Registered Successfully')

    const phsRouter = require('../routers/phs')
    expressApp.use('/phs', phsRouter)
    console.log('[Publishing Houses Router] Router Registered Successfully')

}
