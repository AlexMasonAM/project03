angular
  .module('truckApp')
  .controller('HomeController', HomeController);
    HomeController.$inject = ['$scope', '$resource'];
    function HomeController($scope, $resource){

    $scope.map = { center: { latitude: 34.031115, longitude: -118.266445 }, zoom: 11, options:{scrollwheel: false} };
    $scope.markers = [];

    Marker = $resource('/api/markers');
    Marker.query(function(markers) {
      markers.forEach(function(m) {
        m.coords = {latitude: m.latitude, longitude:m.longitude};
        m.show = false;
        m.title = 'test';
        m.distance = 0;
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

    // get user's current location and use it to calculate distance to each marker (for display in infowindows)
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(pos){
        $scope.myLocation = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
        $scope.markers.forEach(function(m) {
          m.distance = $scope.distanceFrom(m.latitude, m.longitude);
          console.log(m.distance);
        });
      });
    }

    // calculate distance between current location and any lat/lng (in miles)
    $scope.distanceFrom = function(lat, lng) {
      loc = new google.maps.LatLng(lat, lng);
      distanceInMeters = google.maps.geometry.spherical.computeDistanceBetween(loc, $scope.myLocation);
      return distanceInMeters / 1609.34;  // convert to miles
    };


  }
