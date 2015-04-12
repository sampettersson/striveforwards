App = require "../app"

App.controller "carouselController", ($scope, $timeout) ->

  $scope.onHammer = ($event) ->
    if $event.direction is 4
      $scope.navigationDot($scope.activeIndex - 1)
    else if $event.direction is 2
      $scope.navigationDot($scope.activeIndex + 1)

  # Contain all carouselItems
  $scope.carouselItems = [
    {
      image: "/client/assets/images/harvey.milk.jpg"
      headline: "Harvey Milk"
      caption: "The first openly gay person to be elected in california, Harvey dreamt about a better world filled with hope and equality where hate didn't rule."
      country: "United States"
    }
    {
      image: "/client/assets/images/camille.cabral.jpg"
      headline: "Camille Cabral"
      caption: "The first transsexual woman to be elected in the history of the french republic. Camille actively fought against pimps and trafficking and was a co-organizer of the Pute Pride march."
      country: "France"
    }
    {
      image: "/client/assets/images/nadezhda.tolokonnikova.jpg"
      headline: "Nadezhda Tolokonnikova"
      caption: "Human rights activist who fought for women's and LGBT people's rights in russia, a strong opposer against the russian government and it's controversial laws."
      country: "Russia"
    }
  ]

  # Default first carouselItem to be active
  $scope.carouselItems[0].active = true
  $scope.activeIndex = 0

  $scope.navigationDots = []

  $scope.carouselItems.forEach ->

    $scope.navigationDots.push { active: false }

  # Default first navigationDot to be active
  $scope.navigationDots[0].active = true
  $scope.backDisabled = true

  $scope.navigationDot = ($index) ->

    if $scope.activeIndex is $index
      return

    else if $index > ($scope.carouselItems.length - 1)
      return

    else if $index < 0
      return

    $scope.carouselItems.forEach (item) ->
      item.transitionOutLeft = false
      item.transitionOutRight = false

      item.transitionInLeft = false
      item.transitionInRight = false

    # Handle out transitions
    if $scope.activeIndex < $index

      $scope.carouselItems[$scope.activeIndex].transitionOutLeft = true

      previousActiveIndex = parseInt($scope.activeIndex)

      $timeout ->
        $scope.carouselItems[previousActiveIndex].transitionOutLeft = false
        $scope.carouselItems[previousActiveIndex].active = false
      , 250

    else

      $scope.carouselItems[$scope.activeIndex].transitionOutRight = true

      previousActiveIndex = parseInt($scope.activeIndex)

      $timeout ->
        $scope.carouselItems[previousActiveIndex].transitionOutRight = false
        $scope.carouselItems[previousActiveIndex].active = false
      , 250

    # Handle in transitions
    if $scope.activeIndex > $index

      $scope.carouselItems[$index].transitionInLeft = true

      $timeout ->
        $scope.carouselItems[$index].transitionInLeft = false
        $scope.carouselItems[$index].active = true
      , 250

    else

      $scope.carouselItems[$index].transitionInRight = true

      $timeout ->
        $scope.carouselItems[$index].transitionInRight = false
        $scope.carouselItems[$index].active = true
      , 250

    # Set arrow state
    if $index is 0

      $scope.backDisabled = true
      $scope.nextDisabled = false

    else if $index is ($scope.carouselItems.length - 1)

      $scope.backDisabled = false
      $scope.nextDisabled = true

    else

      $scope.backDisabled = false
      $scope.nextDisabled = false

    # Change active navigationDot
    $scope.navigationDots[$scope.activeIndex].active = false
    $scope.navigationDots[$index].active = true

    # Keep track of active index
    $scope.activeIndex = $index