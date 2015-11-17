angular.module('semanticCMSApp')
  .controller 'UsersIndex',
    ['$scope', 'User',
    ($scope, User) ->
      $scope.users = User.query()

      $scope.deleteUser = (user_id, index) ->
        User.delete({id: user_id}, ->
          $scope.users.splice(index, 1)
        )
        return
      return
  ]
