angular.module('semanticCMSApp')
  .controller 'VariablesEdit',
    ['$scope', '$location', '$state', 'Variable',
     ($scope, $location, $state, Variable) ->
       id = $location.path().replace('/!admin/variables/edit/', '')
       $scope.variable = Variable.get({id: id}, ->
         console.dir $scope.variable
       )

       $scope.submit = ($event) ->
         Variable.update(
           {id: $scope.variable.id},
           {variable: {name: $scope.variable.name, sparql: $scope.variable.sparql}},
           -> $state.go('variables_index')
         )
         $event.preventDefault()
         return

       return
    ]
