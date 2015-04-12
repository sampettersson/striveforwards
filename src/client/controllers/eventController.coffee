App = require "../app"

App.controller "eventController", ($scope) ->

  $scope.eventItems = [
    {
      navigation:
        image: "/client/assets/images/events.1972.sweden.small.jpg"
        heading: "1972"
        body: "Sweden becomes first country in the world to allow transsexuals to legally change their sex, and provides free hormone therapy."
      modal:
        image: "/client/assets/images/events.1972.sweden.jpg"
        heading: "1972"
        body: "SOMETHING RANDOM"
    }
  ]