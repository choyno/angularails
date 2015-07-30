AngularRails.factory "Book", ( $resource ) ->

  #$resource("/books/:id", {})  original resource using 2

  $resource("/books/:id", {}, {
    query: { method: "GET", isArray: false }
  })

