App = require "../app"

App.controller "eventController", ($scope) ->

  $scope.eventItems = [
    {
      navigation:
        image: "/client/assets/images/events.1969.stonewall.small.jpg"
        heading: "1969"
        body: "The Stonewall riots."
      modal:
        image: "/client/assets/images/events.1969.stonewall.jpg"
        heading: "1969"
        body: "After police unexplainedly raided a gay bar in New York City, the police found themselves being fought back by some LGBT activists.<br/><br/>The event acted as a catalyst bringing a spark of hope of into the LGBT-community causing several advancements in equality over the comming years."
    }
    {
      navigation:
        image: "/client/assets/images/events.1970.new-york.small.jpg"
        heading: "1970"
        body: "The first pride march in New York City."
      modal:
        image: "/client/assets/images/events.1970.new-york.jpg"
        heading: "1970"
        body: "Dubbed as Gay Liberation Day on the 27th of June in the year of 1970 the first pride march took place in New York City."
    }
    {
      navigation:
        image: "/client/assets/images/events.1972.sweden.small.jpg"
        heading: "1972"
        body: "Sweden becomes first country in the world to allow transsexuals to legally change their sex, and provides free hormone therapy."
      modal:
        image: "/client/assets/images/events.1972.sweden.jpg"
        heading: "1972"
        body: "During the year of 1972 Sweden becomes the first country to allow transsexuals to legally change their sex, but with a sterilization procedure having to be done in order to change it.
              <br/><br/>
              In 2013 the sterilization procedure was deemed inapropriate and the law demanding the procedure was revoked, transsexuals are since then able to legally change their sex without having to be sterilized first."
    }
  ]