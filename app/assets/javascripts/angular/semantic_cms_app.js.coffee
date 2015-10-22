angular.module('semanticCMSApp', ['ngRoute', 'templates', 'ngAnimate', 'ui.router',])
  .config(['$httpProvider', (provider) ->
    provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
  ])
  .config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
    ($stateProvider, $urlRouterProvider, $locationProvider) ->
      $locationProvider.html5Mode({
        enabled: true
        requireBase: false
      })
      $stateProvider
        .state('home', {
            url: '/admin/pages',
            templateUrl: 'pages/index.html',
            controller: 'PagesIndex'
        })
      $urlRouterProvider.otherwise('/')
  ])

$(document).on 'ready page:load', (argumanets) ->
  angular.bootstrap document.body, ['semanticCMSApp']
