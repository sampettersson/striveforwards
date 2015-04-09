App = require "../app"

App.controller "menuController", ($scope, $rootScope, $timeout) ->

  $scope.menu = () ->
    if $scope.menuActive
      $scope.menuTransition = true
      $scope.menuButtonActive = false

      $timeout ->
        $rootScope.applicationViewHidden = false
        $scope.menuActive = false
        $scope.menuTransition = false
      , 250

    else
      $scope.menuTransition = false
      $scope.menuActive = true
      $scope.menuButtonActive = true
      $rootScope.applicationViewHidden = true