AngularRails.controller "BooksController", ($scope, Book, BookService, $http) ->

  $scope.getBooks = () ->
    #BookService.getBooksWithPromises().then ( books ) -> $scope.books = books 1
    # $scope.books = Book.query() using origianl resource 2
    
    Book.query().$promise.then ( response ) ->
     $scope.books = response.books

  $scope.save = () ->
    if $scope.book.id?
      Book.update( $scope.book )
    else
      Book.save($scope.book)

    $scope.book = {}
    $scope.getBooks()

  $scope.edit = ( book ) ->
    $scope.book = Book.get({ id: book.id })

  $scope.delete = (book) ->
    BookService.delete(book, $scope)





