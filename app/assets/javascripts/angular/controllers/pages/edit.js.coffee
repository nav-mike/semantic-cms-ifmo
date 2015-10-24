angular.module('semanticCMSApp')
  .controller 'PagesEdit',
    ['$scope', '$location', '$state', 'Page',
    ($scope, $location, $state, Page) ->
      id = $location.path().replace('/!admin/pages/edit/', '')
      $scope.page = Page.get({id: id})

      $scope.optoins = {
        language: 'en'
        allowedContent: true
        entities: false
      }

      $scope.submit = ($event) ->
        Page.update({ id: $scope.page.id }, $scope.page, ->
          $state.go('pages_index')
        )
        $event.preventDefault()
        return

      return
  ]
