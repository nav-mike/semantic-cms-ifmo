angular.module('semanticCMSApp').factory('Student', ($resource) ->
  $resource('/admin/api/students/:id', null, {
    'update': { method: 'PUT' }
  })
)
