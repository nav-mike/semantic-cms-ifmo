angular.module('semanticCMSApp')
  .controller 'VariablesIndex',
    ['$scope', '$location', 'Variable',
      ($scope, $location, Variable) ->
        $scope.variables = Variable.query()

        $scope.deleteVariable = (variable_id, index) ->
          Variable.delete({id: variable_id}, ->
            $scope.variables.splice(index, 1)
          )
          return
        return
    ]
