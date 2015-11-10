angular.module('semanticCMSApp')
  .controller 'VariablesNew',
    ['$scope', '$state', 'Variable',
      ($scope, $state, Variable) ->
        $scope.variable = {}

        $scope.submit = ($event) ->
          Variable.save({ variable: $scope.variable }, ->
            $state.go('variables_index')
          )
    ]
