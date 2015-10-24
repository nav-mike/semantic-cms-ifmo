angular.module('semanticCMSApp').factory('Page', ($resource) ->
  $resource('/admin/api/pages/:id/:ext', null, {
    'update': { method: 'PUT' }
  })
)
