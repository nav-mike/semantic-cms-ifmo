angular.module('semanticCMSApp')
  .controller 'PagesNew',
    ['$scope', '$state', 'Page',
      ($scope, $state, Page) ->
        $scope.page = {}

        $scope.submit = ($event) ->
          Page.save($scope.page, ->
            $state.go('pages_index')
          )

          $event.preventDefault()
          return
    ]
