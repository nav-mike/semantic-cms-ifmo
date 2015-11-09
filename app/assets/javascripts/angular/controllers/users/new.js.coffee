angular.module('semanticCMSApp')
  .controller 'UsersNew',
    ['$scope', '$state', 'User',
      ($scope, $state, User) ->
        $scope.user = {}

        $scope.submit = ($event) ->
          User.save({ user: $scope.user }, ->
            $state.go('users_index')
          )
    ]
