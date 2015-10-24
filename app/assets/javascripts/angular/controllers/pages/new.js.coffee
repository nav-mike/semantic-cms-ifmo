angular.module('semanticCMSApp')
  .controller 'PagesNew',
    ['$scope', '$state', 'Page',
      ($scope, $state, Page) ->
        $scope.page = {}

        $scope.optoins = {
          language: 'en'
          allowedContent: true
          entities: false
        }

        $scope.submit = ($event) ->
          Page.save($scope.page, ->
            $state.go('pages_index')
          )

          $event.preventDefault()
          return
    ]
