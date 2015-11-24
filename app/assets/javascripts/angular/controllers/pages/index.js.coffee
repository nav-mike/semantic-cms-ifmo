angular.module('semanticCMSApp')
  .controller 'PagesIndex',
    ['$scope', '$location', 'Page', 'ngNotify',
    ($scope, $location, Page, ngNotify) ->
      Page.query().$promise.then ((data) ->
        $scope.pages = data
        ngNotify.set('Pages was successfully upload', 'success')
        return),(
        (error) ->
          ngNotify.set(error.data.message, 'error')
          return
        )

      $scope.deletePage = (page_id, index) ->
        Page.delete({id: page_id}, ->
          $scope.pages.splice(index, 1)
        )
        return
  ]
