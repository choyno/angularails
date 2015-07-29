AngularRails.controller "GitHttpController", ($scope,  $http) ->

  $scope.search = () ->
    url = "https://api.github.com/users/#{$scope.username}/repos"
    $http.get(url)
      .success (data) ->
        $scope.repos = data
