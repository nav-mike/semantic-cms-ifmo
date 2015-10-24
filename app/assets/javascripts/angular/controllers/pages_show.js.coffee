angular.module('semanticCMSApp')
  .controller 'PagesShow',
    ['$scope', '$location', '$sce', 'Page',
    ($scope, $location, $sce, Page) ->
      id = $location.path().replace('/pages/', '')
      $scope.page = Page.get({id: id})
      console.dir $scope.page
  ]
