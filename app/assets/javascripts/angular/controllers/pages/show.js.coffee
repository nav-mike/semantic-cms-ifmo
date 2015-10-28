angular.module('semanticCMSApp')
  .controller 'PagesShow',
    ['$scope', '$location', '$sce', '$state', 'Page',
    ($scope, $location, $sce, $state, Page) ->
      type = $state.current.data.pagePath
      if type is 'id'
        id = $location.path().replace('/pages/', '')
        $scope.page = Page.get({id: id})
      else
        if type is 'path'
          path = $location.path()
          $scope.page = Page.get({id: path}, (page)->
            console.dir page
          )
      return
  ]
