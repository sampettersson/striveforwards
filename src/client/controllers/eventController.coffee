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
        body: "During the year of 1972 Sweden becomes the first country to allow transsexuals to legally change their sex, but with a forced sterilization procedure being done to do so.
              <br/><br/>
              In 2013 the sterilization procedure was deemed inapropriate and the law demanding the procedure was therefore revoked."
    }
  ]