
angular
.module("logu")
.directive("charts", ["$http", function ($http) {
  var COLORS = {
    sleep: [189, 195, 199],
    work: [231, 76, 60],
    run: [155, 89, 182],
    social: [243, 156, 18]
  }

  return {
    restrict: "AE",
    templateUrl: "/app/partials/charts.html",
    scope: { name: "=" },
    link: function (scope, elem, attr) {
      var
        canvas = elem.find("canvas")[0],
        ctx = canvas.getContext("2d");

      $http.get("/api/charts", {
        headers: { user_id: localStorage.getItem("user") }
      }).then(function (response) {
        var options = {
          type: "line",
          data: {
            datasets: response.data.map(function(eventCollection) {
              var
                rgbColor = COLORS[eventCollection.event_name],
                red = rgbColor[0],
                green = rgbColor[1],
                blue = rgbColor[2];

              // var gradient = ctx.createLinearGradient(0, 0, 0, 450);
              //
              // gradient.addColorStop(0 ,'rgba(' + red + ',' + green + ',' + blue + ',0.5)')
              // gradient.addColorStop(0.5 ,'rgba(' + red + ',' + green + ',' + blue + ',0.5)')
              // gradient.addColorStop(1 ,'rgba(' + red + ',' + green + ',' + blue + ',0.5)')

              return {
                label: eventCollection.event_name,
                data: eventCollection.events.map(function(e) {
                  return {x: new Date(e.date).getTime(), y: e.value};
                }),
                // fillColor: gradient,
                borderWidth: 1,
                backgroundColor: 'rgba(' + red + ',' + green + ',' + blue + ',0.5)',
                borderColor: 'rgba(' + red + ',' + green + ',' + blue + ',1)'
              };
            })
          },
          options: {
            scales: {
              xAxes: [{
                type: 'time',
                position: 'bottom',
              }],
              yAxes: [{
                gridLines: {display: false}
              }]
            },
            responsive: false,
            scaleShowVerticalLines: false
          }
        };

        new Chart(canvas, options);
      }, function (response) {
        console.error(response.data);
      });
    }
  }
}]);
