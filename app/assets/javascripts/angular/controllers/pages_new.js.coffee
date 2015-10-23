angular.module('semanticCMSApp')
  .controller 'PagesNew',
    ['$scope', 'Page',
      ($scope, Page) ->
        $scope.page = {}
    ]
