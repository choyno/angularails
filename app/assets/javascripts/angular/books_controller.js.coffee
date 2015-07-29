AngularRails.controller "BooksController", ($scope, $http) ->

  $scope.getBooks = () ->
    $http({ method: "GET", url: $scope.urls.books })
      .success (response) ->
        $scope.books = response.books

  $scope.save = () ->
    $scope.errorMessage = ""
    $http({ method: "POST", url: $scope.urls.books, data: $scope.book })
      .success (response) ->
        $scope.resultMessage = response.message
        $scope.books = response.books
        $scope.book = {}
        $scope.getBooks()
  $scope.delete = (book) ->
    $scope.errorMessage = ""
    $http({ method: "DELETE", url: book.url })
      .success (response) ->
        $scope.resultMessage = response.message
        $scope.getBooks()








