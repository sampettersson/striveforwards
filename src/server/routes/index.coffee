module.exports = class routes

  constructor: (app, express) ->

    router = express.Router()
    app.use router

    applicationRoute = require "./applicationRoute"
    applicationRoute(router)