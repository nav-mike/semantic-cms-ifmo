angular.module('semanticCMSApp')
  .controller 'VariablesIndex',
    ['$scope', '$location', 'Variable',
      ($scope, $location, Variable) ->
        $scope.variables = Variable.query()

        $scope.deleteVariable = (variable) ->
          variable_id = variable.id
          variable.$delete({id: variable_id})
          for it, i in $scope.variables
            if it.id is variable_id
              index = i
              break
          $scope.variables.splice(index, 1) if index = -1
          return
        return
    ]
