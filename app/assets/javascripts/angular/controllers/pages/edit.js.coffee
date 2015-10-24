angular.module('semanticCMSApp')
  .controller 'PagesEdit',
    ['$scope', '$location', 'Page',
    ($scope, $location, Page) ->
      id = $location.path().replace('/!admin/pages/edit/', '')
      $scope.page = Page.get({id: id})

      $scope.optoins = {
        language: 'en'
        allowedContent: true
        entities: false
      }

      return
  ]
