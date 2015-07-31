AngularRails.factory "Book", ( $resource ) ->

  #$resource("/books/:id", {})  original resource using 2

  $resource("/books/:id", { id: "@id" }, {
    query: { method: "GET", isArray: false },
    update: { method: "PUT" },
    remove: { method: "DELETE" }
  })


