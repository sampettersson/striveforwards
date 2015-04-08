require "document-register-element"

# Register custom elements
document.registerElement "application-root"
document.registerElement "application-view"
document.registerElement "application-page"

require "angular"
require "angular-route"

require "lodash"
require "shifty"
require "rekapi"
window.AnimationFrame = require "animation-frame"
require "spark-scroll"


App = angular.module 'strive', ["ngRoute", "gilbox.sparkScroll"]

App.run ['$route', angular.noop]

App.config ($routeProvider, $locationProvider) ->

  $routeProvider.when '/',
    templateUrl: "/client/views/indexView.html"
    controller: "indexController"
  .otherwise
    templateUrl: "/client/views/notFoundView.html"
    controller: "notFoundController"

  $locationProvider.html5Mode true

  return

module.exports = App