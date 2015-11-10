angular.module('semanticCMSApp').factory('Variable', ($resource) ->
  $resource('/admin/api/variables/:id', null, {
    'update': { method: 'PUT' }
  })
)
