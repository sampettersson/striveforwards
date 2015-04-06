module.exports = class applicationRoute

  constructor: (router) ->

    controllers = require "controllers"

    router.get '*', controllers.applicationController.routes.applicationRoute