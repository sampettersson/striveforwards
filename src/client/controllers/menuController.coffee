App = require "../app"

App.controller "menuController", ($scope, $rootScope, $timeout) ->

  $scope.menuButtonCloseHidden = true

  $scope.menu = () ->

    if $scope.menuActive

      $scope.menuTransition = true

      $timeout ->
        $rootScope.applicationViewHidden = false
        $scope.menuActive = false
        $scope.menuTransition = false
      , 250

    else

      $scope.menuTransition = false
      $scope.menuActive = true
      $rootScope.applicationViewHidden = true

      #$timeout ->
      #, 250