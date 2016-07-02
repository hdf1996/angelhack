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
        .state('about', {
          // we'll get to this in a bit
        });

    }])
    .run(function () {});

