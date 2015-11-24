angular.module('semanticCMSApp')
  .controller 'UsersIndex',
    ['$scope', 'User', 'ngNotify'
    ($scope, User, ngNotify) ->
      User.query().$promise.then ((data) ->
        $scope.users = data
        ngNotify.set('Users was successfully upload', 'success')
        return
      ),((error) ->
        ngNotify.set(error.data.message, 'error')
        return
      )

      $scope.deleteUser = (user_id, index) ->
        User.delete({id: user_id}, ->
          $scope.users.splice(index, 1)
        )
        return
      return
  ]
