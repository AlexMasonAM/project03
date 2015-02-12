angular
  .module('truckApp')
  .controller('HomeController', function($scope, $resource){

    $scope.map = { center: { latitude: 34.031115, longitude: -118.266445 }, zoom: 11, options:{scrollwheel: false} };
    $scope.markers = [];

    Marker = $resource('/api/markers');
    Marker.query(function(markers) {
      markers.forEach(function(m) {
        m.coords = {latitude: m.latitude, longitude:m.longitude};
        m.show = false;
        m.title = 'test';
        m.onClick = function() {
          console.log("Clicked!");
          m.show  = !m.show;
        };
        m.onMouse = function() {
          m.show = true;
        };
        $scope.markers.push(m);
      });
      console.log($scope.markers);
      
    });


  });
