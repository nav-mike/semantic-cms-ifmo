angular.module('semanticCMSApp', ['ngRoute', 'templates', 'ngAnimate', 'ui.router',
                                  'ngResource', 'angular-loading-bar', 'ngBootbox',
                                  'ngPageTitle', 'ngSanitize', 'ckeditor', 'ui.bootstrap.buttons',
                                  'ngNotify'])
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
        .state('variables_index', {
          url: '/!admin/variables'
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'VariablesIndex'
            }
            'content@variables_index': {
              templateUrl: 'variables/index.html'
            }
          }
          data: {
            pageTitle: 'Variables'
            pageType: 'admin'
          }
        })
        .state('variables_new', {
          url: '/!admin/variables/new'
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'VariablesNew'
            }
            'content@variables_new': {
              templateUrl: 'variables/new.html'
            }
          }
          data: {
            pageTitle: 'New Variable'
            pageType: 'admin'
          }
        })
        .state('variables_edit',{
          url: '/!admin/variables/edit/:id'
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'VariablesEdit'
            }
            'content@variables_edit': {
              templateUrl: 'variables/edit.html'
            }
          }
        })
        .state('variables_show', {
          url: '/!admin/variables/:id'
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'VariablesShow'
            }
            'content@variables_show': {
              templateUrl: 'variables/show.html'
            }
          }
        })
        .state('users_index', {
          url: '/!admin/users'
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'UsersIndex'
            }
            'content@users_index': {
              templateUrl: 'users/index.html'
            }
          }
          data: {
            pageTitle: 'Users'
            pageType: 'admin'
          }
        })
        .state('users_new', {
          url: '/!admin/users/new'
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'UsersNew'
            }
            'content@users_new': {
              templateUrl: 'users/new.html'
            }
          }
          data: {
            pageTitle: 'New User'
            pageType: 'admin'
          }
        })
        .state('users_edit', {
          url: '/!admin/users/edit/:id'
          views: {
            'layout': {
              templateUrl: 'layouts/admin/layout.html'
              controller: 'UsersEdit'
            }
            'content@users_edit': {
              templateUrl: 'users/edit.html'
            }
          }
          data: {
            pageTitle: 'Edit User'
            pageType: 'admin'
          }
        })
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
      $urlRouterProvider.otherwise('/pages/index')
      return
  ])
