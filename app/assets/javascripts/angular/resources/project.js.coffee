angular.module('semanticCMSApp').factory('Project', ($resource) ->
  $resource('/admin/api/projects/:id', null, {
    'update': { method: 'PUT' }
  })
)
