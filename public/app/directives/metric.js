"use strict";

angular
.module("logu")
.directive("metric", directiveConstructor);

function directiveConstructor() {
  return {
    restrict: "E",
    templateUrl: "/app/partials/metric.html",
    bindToController: true,
    scope: { metricName: "=name" },
    controllerAs: "MetricController",
    controller: controller,
  };

  function controller($http) {
    $http.get("/api/event_correlations/" + this.metricName)
      .then(function(resp) {
        this.eventCorrelations = resp.data;
        this.color = "red"
      }.bind(this));
  }
}
