App = require "../app"

App.controller "menuController", ($scope, $rootScope, $timeout, $document, $location) ->

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

  $scope.scrollTo = (query) ->

    if $location.path() is '/'
      element = angular.element document.getElementById(query)
      $document.scrollToElementAnimated element, 0, 1500

    else

      event = $rootScope.$on '$viewContentLoaded', ->
        # Scroll to desired element
        element = angular.element document.getElementById(query)
        $document.scrollToElementAnimated element, 0, 1500
        # Stop listening to event
        event()

      $location.path('/')
