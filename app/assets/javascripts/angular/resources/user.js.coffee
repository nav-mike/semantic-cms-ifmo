angular.module('semanticCMSApp').factory('User', ($resource) ->
  $resource('/admin/api/users/:id', null, {
    'update': { method: 'PUT' }
  })
)
