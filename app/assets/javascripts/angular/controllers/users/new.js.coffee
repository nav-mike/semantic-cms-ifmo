angular.module('semanticCMSApp')
  .controller 'UsersNew',
    ['$scope', '$state', 'User',
      ($scope, $state, User) ->
        $scope.user = {}

        $scope.submit = ($event) ->
          User.save($scope.user, ->
            $state.go('users_index')
          )
    ]
