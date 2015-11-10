angular.module('semanticCMSApp')
  .controller 'VariablesIndex',
    ['$scope', '$location', 'Variable',
      ($scope, $location, Variable) ->
        $scope.variables = Variable.query()

        return
    ]
