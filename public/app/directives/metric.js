"use strict";

angular
.module("logu")
.directive("metric", directiveConstructor);

function directiveConstructor() {
  return {
    bindToController: true,
    scope: { metricName: "=name" },
    controllerAs: "MetricController",
    controller: controller,
    templateUrl: "/app/partials/metric.html"
  };

  function controller() {

  }
}
