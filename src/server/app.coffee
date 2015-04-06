process.env.NODE_PATH = __dirname

module = require "module"
module.Module._initPaths()

express = require "express"
exphbs  = require "express-handlebars"

app = express()

app.use "/client", express.static __dirname.concat("/../client")

app.engine ".hbs", exphbs extname: ".hbs"
app.set "view engine", ".hbs"
app.set "views", __dirname.concat "/views"

routes = require "routes"
routes app, express

if process.env.NODE_ENV is "development"

      app.listen 8080

else

      port = process.env.PORT

      app.listen port