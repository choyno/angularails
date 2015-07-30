AngularRails.controller "BooksController", ($scope, Book, BookService, $http) ->

  $scope.getBooks = () ->
    #BookService.getBooksWithPromises().then ( books ) -> $scope.books = books 1
    # $scope.books = Book.query() using origianl resource 2
    
    Book.query().$promise.then ( response ) ->
     $scope.books = response.books

  $scope.save = () ->
    Book.save($scope.book)
    $scope.book = {}
    $scope.getBooks()

  $scope.edit = (book) ->
    $scope.book =
      id: book.id
      title: book.title
      author: book.author
      url: book.url

  $scope.delete = (book) ->
    BookService.delete( book, $scope )








