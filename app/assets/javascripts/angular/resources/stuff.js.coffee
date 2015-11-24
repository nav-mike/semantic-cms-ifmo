angular.module('semanticCMSApp').factory('Stuff', ($resource) ->
  $resource('/admin/api/stuff/:id', null, {
    'update': { method: 'PUT' }
  })
)
