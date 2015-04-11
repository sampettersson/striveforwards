App = require "../app"

App.controller "creditsController", ($scope) ->
  $scope.creditItems = [
    {
      title: "Bombs by Maciek Lulko"
      url: "https://www.flickr.com/photos/lulek/9532704386"
      source: "Flickr"
      license: "CC BY 2.0"
    }
    {
      title: "LGBT Pride Rennes by Julie Missbutterflies"
      url: "https://www.flickr.com/photos/missbutterfly/14666700020"
      source: "Flickr"
      license: "CC BY-SA 2.0"
    }
    {
      title: "Milk Sworn In 2"
      url: "http://milkfoundation.org/wp-content/uploads/2010/02/MilkSwornIn2.jpg"
      source: "Milk foundation"
      license: "Harvey Milk Foundation"
    }
  ]