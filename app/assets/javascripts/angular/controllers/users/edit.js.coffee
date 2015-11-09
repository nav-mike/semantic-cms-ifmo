angular.module('semanticCMSApp')
  .controller 'UsersEdit',
    ['$scope', '$location', '$state', 'User',
      ($scope, $location, $state, User) ->
        id = $location.path().replace('/!admin/users/edit/', '')
        $scope.user = User.get({id: id}, ->
          console.dir $scope.user
        )

        $scope.submit = ($event) ->
          User.update({ id: $scope.user.id }, $scope.user, ->
            $state.go('users_index')
          )
          $event.preventDefault()
          return
    ]
