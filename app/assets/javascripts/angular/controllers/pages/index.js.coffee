angular.module('semanticCMSApp')
  .controller 'PagesIndex',
    ['$scope', '$location', 'Page',
    ($scope, $location, Page) ->
      $scope.pages = Page.query()

      $scope.deletePage = (page) ->
        _id = page.id
        page.$delete({id: page.id})
        index = -1
        for it, i in $scope.pages
          if it.id is _id
            index = i
            break
        $scope.pages.splice(index, 1) if index != -1
        return
  ]
