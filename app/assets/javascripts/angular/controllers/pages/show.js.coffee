angular.module('semanticCMSApp')
  .controller 'PagesShow',
    ['$scope', '$location', '$sce', '$state', 'Page',
    ($scope, $location, $sce, $state, Page) ->
      id = $location.path().replace('/pages/', '')
      $scope.page = Page.get({id: id})
      return
  ]
