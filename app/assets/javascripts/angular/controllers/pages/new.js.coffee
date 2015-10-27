angular.module('semanticCMSApp')
  .controller 'PagesNew',
    ['$scope', '$state', 'Page',
      ($scope, $state, Page) ->
        $scope.page = {}
        $scope.page.mode = 'text'

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

        $scope.changeContentType = ($event) ->
          $scope.mode = if $scope.mode is 'erb' then 'text' else 'erb'
          $scope.mode_name = if $scope.mode is 'erb' then 'use CKEditor' else 'use ERB-template'
          $event.preventDefault()
          return

        $scope.dynamicPopover = {
          content: 'Hello, World!',
          templateUrl: 'popover.html',
          title: 'Title'
        }
        return
    ]
