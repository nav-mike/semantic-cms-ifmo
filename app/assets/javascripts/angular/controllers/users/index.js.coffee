angular.module('semanticCMSApp')
  .controller 'UsersIndex',
    ['$scope', 'User',
    ($scope, User) ->
      $scope.users = User.query()

      $scope.deleteUser = (user) ->
        user_id = user.id
        user.$delete({id: user_id})
        for it, i in $scope.users
          if it.id is user_id
            index = i
            break
        $scope.users.splice(index, 1) if index = -1
        return
      return
  ]
