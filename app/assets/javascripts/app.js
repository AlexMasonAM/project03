(function() {
  var app = angular.module('truckApp', ['ngResource']);

  app.controller('MapController', function($resource, $interval) {
    var scope = this;
    var center = new google.maps.LatLng(34.0294007,-118.2668506);
    var options = {center: center, zoom: 11, scrollwheel: false};
    this.map = new google.maps.Map(document.getElementById('map-canvas'), options);

    var m = new google.maps.Marker({position:center, map:this.map});

    Marker = $resource('/markers', {}, {
      query: {method:'GET', isArray:true}
    });
    var markers = Marker.query();

    $interval(function() {
      for(var i = 0; i < markers.length; i++) {
        var latlng = new google.maps.LatLng(markers[i].latitude, markers[i].longitude);
        var m = new google.maps.Marker({
          position: latlng,
          map: scope.map
        });
      }
    }, 15000);

  });






})();