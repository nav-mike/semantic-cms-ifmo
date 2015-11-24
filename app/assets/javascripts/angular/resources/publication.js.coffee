angular.module('semanticCMSApp').factory('Publication', ($resource) ->
  $resource('/admin/api/publications/:id', null, {
    'update': { method: 'PUT' }
  })
)
