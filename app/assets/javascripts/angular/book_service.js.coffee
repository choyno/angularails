AngularRails.factory "Book", ( $http ) ->
  self = {}

  self.getBooks = (scope) ->
    $http({ method: "GET", url: scope.urls.books })
      .success (response) ->
        scope.books = response.books

  self.delete = (book, scope) ->
    scope.errorMessage = ""
    $http({ method: "DELETE", url: book.url })
      .success (response) ->
        scope.resultMessage = response.message
        scope.book = {}
        scope.getBooks()

  self

