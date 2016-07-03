angular.module("logu", [
    'ui.router',
    'ui.bootstrap'
  ])
  .config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
      $urlRouterProvider.otherwise('/home');
      $urlRouterProvider.when('/dashboard', '/dashboard/general');

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
        })
        .state('dashboard.general', {
          url: '/general',
          templateUrl: '/app/partials/general.html'
        })
        .state('dashboard.metric', {
          url: '/:name',
          template: '<metric name="metricName"></metric>',
          controller: function($stateParams, $scope) {
            $scope.metricName = $stateParams.name;
          }
        })
        .state('login', {
          url: '/login',
          templateUrl: '/app/partials/login.html',
          controller: 'LoginController'
        });
    }])
    .run(function () {});
