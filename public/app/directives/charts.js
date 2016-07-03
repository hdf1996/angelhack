
angular.module("logu")
  .directive("charts", ["$http", function ($http) {
    return {
      restrict: "AE",
      templateUrl: "/app/partials/charts.html",
      scope: { name: "=" },
      link: function (scope, elem, attr) {
        $http.get("/api/charts", {
          headers: { user_id: localStorage.getItem("user") }
        }).then(function (response) {
          var options = {
            type: "line",
            data: {
              datasets: response.data.map(function(eventCollection) {
                var red = Number(Math.ceil(Math.random() * 255));
                var green = Number(Math.ceil(Math.random() * 255));
                var blue = Number(Math.ceil(Math.random() * 255));

                return {
                  label: eventCollection.event_name,
                  data: eventCollection.events.map(function(e) {
                    return {x: new Date(e.date).getTime(), y: e.value};
                  }),
                  fill: true,
                  borderWidth: 1,
                  backgroundColor: 'rgba(' + red + ',' + green + ',' + blue + ',0.2)',
                  borderColor: 'rgba(' + red + ',' + green + ',' + blue + ',1)'
                };
              })
            },
            options: {
              scales: { xAxes: [{ type: 'linear', position: 'bottom' }] },
              responsive: false
            }
          };

          new Chart(elem.find("canvas"), options);
        }, function (response) {
          console.error(response.data);
        });
      }
    }
  }]);
