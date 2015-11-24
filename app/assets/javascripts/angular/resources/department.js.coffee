angular.module('semanticCMSApp').factory('Department', $(resource) ->
  $resource('/admin/api/settings/:id', null, {
    'update': { method: 'PUT' }
  })
)
