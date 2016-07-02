angular.module("logu")
  .controller('LoginController', ['$scope', '$state', function ($scope, $state) {
    $scope.user = {};

    $scope.login = function () {
      localStorage.setItem('user', $scope.user.name);
      $state.go("home");
    }
  }]);