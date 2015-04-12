App = require "../app"

App.controller "applicationModalController", ($scope, $rootScope, $timeout) ->

  $rootScope.openModal = (content) ->
    $scope.active = true
    $scope.disableScroll = true

    $scope.image = content.image
    $scope.heading = content.heading
    $scope.body = content.body

  $scope.hideModal = ($event) ->

    console.log $event.target.className

    hideIt = () ->

      $scope.fadeOut = true

      $timeout ->
        $scope.disableScroll = false
        $scope.fadeOut = false
        $scope.active = false

      , 250

    switch $event.target.className
      when "modal-bg" then hideIt()
      when "mobile-close-button" then hideIt()
      when "fa fa-close" then hideIt()

