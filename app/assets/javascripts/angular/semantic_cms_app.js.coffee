angular.module('semanticCMSApp', ['ngRoute', 'templates', 'ngAnimate', 'ui.router',
                                  'ngResource', 'angular-loading-bar', 'ngBootbox',
                                  'ngPageTitle', 'ngSanitize'])
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
        .state('pages_index', {
            url: '/!admin/pages'
            templateUrl: 'pages/index.html'
            controller: 'PagesIndex'
            data: {
              pageTitle: 'Pages | Semantic CMS Admin pages'
            }
        })
        .state('pages_new', {
          url: '/!admin/pages/new'
          templateUrl: 'pages/new.html'
          controller: 'PagesNew'
          data: {
            pageTitle: 'New Page | Semantic CMS Admin pages'
          }
        })
        .state('pages_edit', {
          url: '/!admin/pages/edit/:id',
          templateUrl: 'pages/edit.html'
          controller: 'PagesEdit'
          data: {
            pageTitle: 'Edit Page | Semantic CMS Admin pages'
          }
        })
        .state('pages_show', {
          url: '/pages/:id'
          templateUrl: 'pages/show.html'
          controller: 'PagesShow'
        })
      $urlRouterProvider.otherwise('/')
      return
  ])

# $(document).on 'ready page:load', (argumanets) ->
  # angular.bootstrap document.body, ['semanticCMSApp']
