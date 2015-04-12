App = require "../app"

App.controller 'indexController', ($scope, $document) ->

  $scope.content = {
    primaryBodyHeadline: "OUR WORLD IS A DARK PLACE LET'S TURN THE LIGHTS ON"
  }

  $scope.scroll = ->
    element = angular.element document.getElementById('intro')
    $document.scrollToElementAnimated element, 0, 1500

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

App.directive "eventView", ->
  directive = {}

  directive.element = "E"
  directive.templateUrl = "/client/views/eventView.html"
  directive.controller = "eventController"

  return directive
