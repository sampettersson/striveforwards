module.exports = class modelName

  mongoose = require "mongoose"

  class @schema

    @model = new mongoose.Schema
      content: String

  @model = mongoose.model "model", @schema.model