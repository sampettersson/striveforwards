App = require "../app"

App.controller 'indexController', ($scope, $rootScope) ->

App.directive "arrowContainer", ($timeout) ->
  directive = {}

  directive.element = "E"
  directive.templateUrl = "/client/views/arrowContainerView.html"

  directive.link = ($scope) ->

    active = false

    setTimer = ->

      $timeout ->

        $scope.animation = active

        active = !active

        setTimer()

      , 5000

    setTimer()

  return directive

App.directive "primaryBodyHeadline", ($timeout, $window) ->
  directive = {}

  directive.element = "E"

  directive.link = ($scope, $element) ->

    $scope.primaryBodyHeadlineHeight = "0px"

    headlineHeight = ->
      $scope.primaryBodyHeadlineHeight = "-" + $element[0].offsetHeight + "px"

    angular.element($window).bind "resize", ->
      headlineHeight()

    $timeout () ->
      headlineHeight()

    , 100

    return directive

App.directive "indexCarousel", () ->
  directive = {}

  directive.element = "E"
  directive.templateUrl = "/client/views/carouselView.html"
  directive.controller = "carouselController"

  return directive