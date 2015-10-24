angular.module('semanticCMSApp')
  .controller 'PagesEdit',
    ['$scope', '$location', 'Page',
    ($scope, $location, Page) ->
      id = $location.path().replace('/!admin/pages/edit/', '')
      $scope.page = Page.get({id: id})
      console.dir $scope.page
  ]
