require "document-register-element"

# Register custom elements
document.registerElement "application-root"
document.registerElement "application-view"
document.registerElement "application-page"

require "angular"
require "angular-route"
require "angular-skrollr"

App = angular.module 'strive', ["ngRoute", "sn.skrollr"]

App.config (snSkrollrProvider) ->
  snSkrollrProvider.config =
    forceHeight: false
    smoothScrolling: true

App.run ["snSkrollr", (snSkrollr) ->
  snSkrollr.init();
]

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