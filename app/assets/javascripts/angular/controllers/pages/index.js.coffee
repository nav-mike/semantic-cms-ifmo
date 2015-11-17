angular.module('semanticCMSApp')
  .controller 'PagesIndex',
    ['$scope', '$location', 'Page',
    ($scope, $location, Page) ->
      $scope.pages = Page.query()

      $scope.deletePage = (page_id, index) ->
        Page.delete({id: page_id}, ->
          $scope.pages.splice(index, 1)
        )
        return
  ]
