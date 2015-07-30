AngularRails.factory "Book", ( $http, $q ) ->
  self = {}

  self.getBooksWithPromises = () ->
    deferred = $q.defer()
    $http({ method: "GET",  url: "/books"})
      .success (response) ->
        deferred.resolve(response.books)

    deferred.promise


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

