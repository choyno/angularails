AngularRails.controller "GitHttpController", ($scope,  $http) ->

  $scope.search = () ->
    #adding loader 
    $scope.repos = [] #Clear array
    $scope.errorMessage = ""
    $scope.searching = true #Set searching to true before we make our http request.
    url = "https://api.github.com/users/#{$scope.username}/repos"
    $http.get(url)
      .success (data) ->
        $scope.searching = false #Set searching to false after we get our result.
        $scope.repos = data
      .error (date, status) ->
        $scope.searching = false
        if status == 404
          $scope.errorMessage = "User  not found"

