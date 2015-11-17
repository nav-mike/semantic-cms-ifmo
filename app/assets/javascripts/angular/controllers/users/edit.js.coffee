angular.module('semanticCMSApp')
  .controller 'UsersEdit',
    ['$scope', '$location', '$state', 'User',
      ($scope, $location, $state, User) ->
        id = $location.path().replace('/!admin/users/edit/', '')
        $scope.user = User.get({id: id}, ->
          console.dir $scope.user
        )

        $scope.submit = ($event) ->
          User.update({ id: $scope.user.id }, {
              user: {
                email: $scope.user.email,
                password: $scope.user.password,
                password_confirmation: $scope.user.password_confirmation
              }
            }, ->
            $state.go('users_index')
          )
          $event.preventDefault()
          return
    ]
