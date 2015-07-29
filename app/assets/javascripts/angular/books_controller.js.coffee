AngularRails.controller "BooksController", ($scope, $http) ->

  $scope.getBooks = () ->
    $http({ method: "GET", url: $scope.urls.books })
      .success (response) ->
        $scope.books = response.books

  $scope.save = () ->
    $scope.errorMessage = ""
    if $scope.book.id?
      $http({ method: "PUT", url: $scope.book.url, data: $scope.book })
        .success (response) ->
          $scope.resultMessage = response.message
          $scope.book = {}
          $scope.getBooks()
    else
      $http({ method: "POST", url: $scope.urls.books, data: $scope.book })
        .success (response) ->
          $scope.resultMessage = response.message
          $scope.book = {}
          $scope.getBooks()


  $scope.edit = (book) ->
    $scope.book =
      id: book.id
      title: book.title
      author: book.author
      url: book.url

  $scope.delete = (book) ->
    $scope.errorMessage = ""
    $http({ method: "DELETE", url: book.url })
      .success (response) ->
        $scope.resultMessage = response.message
        $scope.getBooks()








