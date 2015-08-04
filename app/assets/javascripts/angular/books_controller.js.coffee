AngularRails.controller "BooksController", ($scope, Book, $http) ->

  $scope.init = () ->
    $scope.currentPage = 1
    $scope.getBooks()

  $scope.getBooks = () ->
    $http({method: "GET", url:"/books", params: { page: $scope.currentPage }})
      .success (response) ->
        $scope.books = response.books
        $scope.paging = response.meta
        $scope.createPages()


  $scope.createPages = () ->
    $scope.pages = [1..$scope.paging.number_of_pages]

  $scope.setPage = (newPage) ->
    newPage = 1 if newPage < 1
    $scope.currentPage = newPage
    $scope.getBooks()

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
    Book.delete( book, $scope )








