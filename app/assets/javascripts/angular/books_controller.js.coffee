AngularRails.controller "BooksController", ($scope, $http) ->

  $scope.getBooks = () ->
    $http.get("/books")
      .success (response) ->
        $scope.books = response.books
