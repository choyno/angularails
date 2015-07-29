AngularRails.controller "TacoOrderController", ($scope) ->

 $scope.tacos = []
 $scope.taco = {}

 $scope.fillings = ["Beef", "Chicken", "Fish", "Carnitas"]
 $scope.extras = [ { name: "Sour Cream" }, { name: "Guac" }, { name: "Salsa" }]
 $scope.cheeses = ["No Cheese", "Normal Cheese", "Mucho Queso", "Monterrey Jack"]

 $scope.clear = () ->
  $scope.taco = {}
  for extra in $scope.extras #set all checkboxes to false
    extra.checked = false

 $scope.getExtras = () ->
  extras = []
  for extra in $scope.extras
    if extra.checked == true #check if checkbox is true
      extras.push(extra.name) #add inside the array
  extras # return extras

 $scope.addTaco = () ->
  $scope.taco.extras = $scope.getExtras() # getExtras checked values and add to the extra variable
  $scope.tacos.push($scope.taco)

  $scope.clear()
