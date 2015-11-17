angular.module('semanticCMSApp')
  .controller 'VariablesShow',
    ['$scope', '$location', '$state', '$http',
     ($scope, $location, $state, $http) ->
       id = $location.path().replace('/!admin/variables/', '')
       response = $http.get("/admin/api/variables/#{id}/exec")
       response.success (data, status) ->
         $scope.result = data
         console.dir $scope.result
        response.error (data, status) ->
          console.error data

       return
    ]
