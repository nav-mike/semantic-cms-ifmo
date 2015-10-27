angular.module('semanticCMSApp')
  .controller 'PagesEdit',
    ['$scope', '$location', '$state', 'Page',
    ($scope, $location, $state, Page) ->
      id = $location.path().replace('/!admin/pages/edit/', '')
      $scope.page = Page.get({id: id}, ->
        console.dir $scope.page
        $scope.page.ckeditor = $scope.page.html
        $scope.page.erb = $scope.page.html
        $scope.page.mode = 'text'
      )



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

      $scope.changeContentType = ($event) ->
        $scope.mode = if $scope.page.mode is 'erb' then 'text' else 'erb'
        $event.preventDefault()
        return

      return
  ]
