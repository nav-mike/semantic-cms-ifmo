angular.module('semanticCMSApp', ['ngRoute', 'templates', 'ngAnimate', 'ui.router',
                                  'ngResource', 'angular-loading-bar', 'ngBootbox',
                                  'ngPageTitle', 'ngSanitize', 'ckeditor', 'ui.bootstrap.buttons'])
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
            views: {
              'layout': {
                templateUrl: 'layouts/admin/layout.html'
                controller: 'PagesIndex'
              }
              'content@pages_index': {
                templateUrl: 'pages/index.html'
              }
            }
            data: {
              pageTitle: 'Pages'
              pageType: 'admin'
            }
        })
        .state('pages_new', {
          url: '/!admin/pages/new'
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'PagesNew'
            }
            'content@pages_new': {
              templateUrl: 'pages/new.html'
            }
          }
          data: {
            pageTitle: 'New Page'
            pageType: 'admin'
          }
        })
        .state('pages_edit', {
          url: '/!admin/pages/edit/:id',
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'PagesEdit'
            }
            'content@pages_edit': {
              templateUrl: 'pages/edit.html'
            }
          }
          data: {
            pageTitle: 'Edit Page'
            pageType: 'admin'
          }
        })
        .state('pages_show', {
          url: '/pages/{id:int}'
          views: {
            'layout': {
              templateUrl: 'layouts/public/layout.html'
              controller: 'PagesShow'
            }
            'content@pages_show': {
              templateUrl: 'pages/show.html'
            }
          }
          data: {
            pageType: 'public'
            pagePath: 'id'
          }
        })
        .state('pages_show_custom', {
          url: '/{path:[a-zA-Z0-9\-_\/]+}'
          views: {
            'layout': {
              templateUrl: 'layouts/public/layout.html'
              controller: 'PagesShow'
            }
            'content@pages_show_custom': {
              templateUrl: 'pages/show.html'
            }
          }
          data: {
            pagePath: 'path'
          }
        })
      $urlRouterProvider.otherwise('/')
      return
  ])

# $(document).on 'ready page:load', (argumanets) ->
  # angular.bootstrap document.body, ['semanticCMSApp']
