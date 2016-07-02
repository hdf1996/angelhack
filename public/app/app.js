angular.module("logu", [
    'ui.router',
    'ui.bootstrap'
  ])
  .config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
      $urlRouterProvider.otherwise('/home');

      $stateProvider
        .state('home', {
          url: '/home',
          templateUrl: '/app/partials/landing.html'
        })
        .state('dashboard', {
          url: '/dashboard',
          templateUrl: '/app/partials/dashboard.html',
          controller: 'DashboardController'
        })
        .state('dashboard.connect-applications', {
          url: '/connect-applications',
          templateUrl: '/app/partials/connect-applications.html'
          // controller: 'DashboardController'
        })
        .state('login', {
          url: '/login',
          templateUrl: '/app/partials/login.html',
          controller: 'LoginController'
        });
    }])
    .run(function () {});
