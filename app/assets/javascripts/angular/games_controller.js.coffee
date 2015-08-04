AngularRails.controller "GamesController", ($scope, $http) ->

 $scope.wew ="heelo"

 $scope.getBooks = () ->
   $http.get("/games")
     .success (response) ->
       $scope.books = response.books
