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

        $scope.onReady = ->
          $('#cke_ng_ckeditor').popover({
            content: 'You could use <a target=\'_blank\' href=\'http://apidock.com/ruby/ERB\'>ERB-templates</a> for insert next global variables: <code>@projects</code>'
            placement: 'left'
            title: 'Help'
            html: 'true'
          })
          $('#cke_ng_ckeditor').popover('show')
          return
    ]
