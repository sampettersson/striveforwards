App = require "../app"

App.controller "menuController", ($scope, $rootScope) ->

  $scope.menu = () ->
    console.log "menu"

    if $scope.menuActive
      $rootScope.applicationViewHidden = false
      $scope.menuActive = false

    else
      $scope.menuActive = true
      $rootScope.applicationViewHidden = true