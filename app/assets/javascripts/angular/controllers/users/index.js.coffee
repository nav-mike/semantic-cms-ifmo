angular.module('semanticCMSApp')
  .controller 'UsersIndex',
    ['$scope', 'User',
    ($scope, User) ->
      $scope.users = User.query()
      return
  ]
