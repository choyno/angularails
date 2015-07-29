AngularRails.controller "BooksController", ($scope, $http) ->

  $scope.getBooks = () ->
    $http({ method: "GET", url: $scope.urls.books})
      .success (response) ->
        $scope.books = response.books

  $scope.save = () ->
    $http({ method: "POST", url: $scope.urls.books, data: $scope.book })
      .success (response) ->
        $scope.books = response.books
        $scope.book = {}
        $scope.getBooks()

