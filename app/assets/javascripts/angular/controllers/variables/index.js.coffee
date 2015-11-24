angular.module('semanticCMSApp')
  .controller 'VariablesIndex',
    ['$scope', '$location', 'Variable', 'ngNotify'
      ($scope, $location, Variable, ngNotify) ->
        Variable.query().$promise.then ((data) ->
          $scope.variables = data
          ngNotify.set('Variables was successfully upload', 'success')
        ), ((error) ->
          ngNotify.set(error.data.message, 'error')
        )

        $scope.deleteVariable = (variable_id, index) ->
          Variable.delete({id: variable_id}, ->
            $scope.variables.splice(index, 1)
          )
          return
        return
    ]
