AngularRails.controller "GitHttpController", ($scope,  $http) ->

  $scope.search = () ->
    url = "https://api.github.com/users/#{$scope.username}/repos"
    $http({ method: "GET", url: url })
      .success (data) ->
        $scope.repos = data
