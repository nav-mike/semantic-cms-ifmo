angular.module('semanticCMSApp', [])
  .config(['$httpProvider', (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])

$(document).on 'ready page:load', (argumanets) ->
  angular.bootstrap document.body, ['semanticCMSApp']
