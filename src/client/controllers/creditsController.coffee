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
      title: "Dr. Camille Cabral by Kenji-Baptiste OIKAWA"
      url: "http://en.wikipedia.org/wiki/Camille_Cabral#/media/File:Camille_Cabral_pour_les_Trans.JPG"
      source: "Wikipedia"
      license: "CC BY 3.0"
    }
    {
      title: "Maria Alyokhina and Nadezhda Tolokonnikova of Pussy Riot by Greg Chow"
      url: "https://www.flickr.com/photos/g-rock/12377316034/"
      source: "Flickr"
      license: "CC BY-NC-ND 2.0"
    }
    {
      title: "Nikolay Alexeyev by Niko111"
      url: "http://commons.wikimedia.org/wiki/File:NikolayAlekseevVancouver.jpg"
      source: "Wikimedia"
      license: "CC BY-SA 3.0"
    }
    {
      title: "Harvey Milk by Daniel Nicoletta"
      url: "http://commons.wikimedia.org/wiki/File:Harvey_Milk_Campaigning_With_Longshormen_in_1976.jpg"
      source: "Wikimedia"
      license: "CC BY-SA 3.0"
    }
    {
      title: "Stonewall Inn by Diana Davies"
      url: "http://en.wikipedia.org/wiki/Stonewall_riots#/media/File:Stonewall_Inn_1969.jpg"
      source: "Wikipedia"
      license: "CC BY-SA 3.0"
    }
    {
      title: "Gay rights protesters in New York City by Leffler, Warren K."
      url: "http://en.wikipedia.org/wiki/1970s_in_LGBT_rights#/media/File:Gay_Rights_demonstration,_NYC_1976.jpg"
      source: "Wikipedia"
      license: "Public Domain"
    }
    {
      title: "Stockholm Pride Parade 2009 by Bengt Nyman"
      url: "http://commons.wikimedia.org/wiki/File:Stockholm_Pride_Parade_2009.jpg"
      source: "Wikimedia"
      license: "CC BY 2.0"
    }
  ]