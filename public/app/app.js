angular.module("logu", [
    'ui.router',
    'ui.bootstrap'
  ])
  .controller('LoginController', ['$scope', '$state', function ($scope, $state) {
    $scope.user = {};

    $scope.login = function () {
      localStorage.setItem('user', $scope.user.name);
      $state.go("home");
    }
  }])
  .config(['$stateProvider', '$urlRouterProvider',
    function($stateProvider, $urlRouterProvider) {
      $urlRouterProvider.otherwise('/home');

      $stateProvider
        .state('home', {
          url: '/home',
          templateUrl: '/app/partials/landing.html'
        })
        .state('login', {
          url: '/login',
          templateUrl: '/app/partials/login.html',
          controller: 'LoginController'
        });
    }])
    .run(function () {});

