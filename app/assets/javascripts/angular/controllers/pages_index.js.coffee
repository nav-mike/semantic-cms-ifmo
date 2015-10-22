angular.module('semanticCMSApp')
  .controller 'PagesIndex',
    ['$scope', '$location', 'Page',
    ($scope, $location, Page) ->
      $scope.pages = Page.query()
  ]
