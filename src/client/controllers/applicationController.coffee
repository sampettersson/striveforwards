App = require "../app"

App.directive "applicationRoot", ->
  directive = {}

  directive.restrict = "E"
  directive.templateUrl = "/client/views/applicationView.html"

  return directive

App.directive "applicationMenu", ->
  directive = {}

  directive.restrict = "E"
  directive.templateUrl = "/client/views/menuView.html"

  return directive


App.controller 'applicationController', ($scope, $rootScope) ->