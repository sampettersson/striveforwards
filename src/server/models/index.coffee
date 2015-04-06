module.exports = class models

  constructor: () ->

    mongoose = require "mongoose"
    mongoose.connect process.env.MONGODB_URL

    @modelName = require "./modelName"

    return @