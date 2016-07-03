
angular.module("logu")
  .directive("charts", ["$http", function ($http) {
    return {
      restrict: "AE",
      templateUrl: "app/partials/charts.html",
      scope: {
        sets: "=",
        from: "=",
        to: "=",
        name: "="
      },
      link: function (scope, elem, attr) {
        "use strict";
        var canvas = elem.find("canvas").eq(0);

        if (!scope.from) {
          scope.from = "";
        }

        if (!scope.to) {
          scope.to = "";
        }


        scope.name="sleep"
        $http.get("/api/charts?from=" + scope.from + "&to=" + scope.to + "&name=" + scope.name, {
          headers: {
            user_id: localStorage.getItem("user")
          }
        }).then(function (response) {
          options.data.datasets = response.data.map(function (dataset) {
            var red = Number(Math.ceil(Math.random() * 255));
            var green = Number(Math.ceil(Math.random() * 255));
            var blue = Number(Math.ceil(Math.random() * 255));

            return {
              label: dataset.label,
              data: dataset.data,
              fill: false,
              snapGaps: true,
              borderWidth: 1,
              backgroundColor: 'rgba(' + red + ',' + green + ',' + blue + ', 0.2)',
              borderColor: 'rgba(' + red + ',' + green + ',' + blue + ',1)'
            }
          });
          new Chart(canvas, options);
        }, function (response) {
          console.error(response.data);
        });

        /*
        options.data.datasets = [
          {
            // Titulo que representa este set de datos
            label: 'Horas de Sueño',
            data: [5, 4, 5, 6, 8, 7, 3],
            fill: false,
            backgroundColor: "rgba(255,99,132,0.2)",
            borderColor: "rgba(255,99,132,1)",
            borderWidth: 1
          },
          {
            // Titulo que representa este set de datos
            label: 'Horas de Actividad Fisica',
            data: [2, 3, 2, 1, 1, 4, 2],
            fill: false,
            backgroundColor: "rgba(255,99,132,0.2)",
            borderColor: "rgba(108, 77, 93,1)",
            borderWidth: 1
          }
        ];
      */

        new Chart(canvas, options);
      }
    }
  }]);


