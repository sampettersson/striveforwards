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
require "spark-scroll"
require "angular-scroll"
require "ng-device-detector"
require "hammerjs"
require "angular-hammer"
require "angular-sanitize"

window.AnimationFrame = require "animation-frame"

App = angular.module 'strive', ["ngRoute", "gilbox.sparkScroll", "duScroll", "ng.deviceDetector", "hmTouchEvents", "ngSanitize"]

App.run ['$route', angular.noop]

App.config ($routeProvider, $locationProvider) ->

  $routeProvider.when '/',
    templateUrl: "/client/views/indexView.html"
    controller: "indexController"
  .when '/about/credits',
    templateUrl: '/client/views/creditsView.html'
    controller: "creditsController"
  .otherwise
    templateUrl: "/client/views/notFoundView.html"
    controller: "notFoundController"

  $locationProvider.html5Mode true

  return

module.exports = App