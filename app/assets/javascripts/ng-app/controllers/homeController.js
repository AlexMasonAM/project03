angular
  .module('truckApp')
  .controller('HomeController', HomeController);
  
  HomeController.$inject = ['$scope', '$resource'];
  
  function HomeController($scope, $resource){
    var self = this;
    $scope.map = { center: { latitude: 34.031115, longitude: -118.266445 }, zoom: 10, options:{scrollwheel: false} };
    $scope.markers = [];

    User = $resource('/api/users/:id', {id: '@id'});
    if(currentUser && currentUser.type == 'User') {
      User.get({id: currentUser.id}, function(data) {
        self.loggedInUser = data;
      });
    }


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

      $scope.allMarkers = $scope.markers.slice();
      $scope.sixMarkers = $scope.markers.slice(0,6);
    });



    // get user's current location and use it to calculate distance to each marker (for display in infowindows)
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(pos){
        $scope.myLocation = new google.maps.LatLng(pos.coords.latitude, pos.coords.longitude);
        $scope.markers.forEach(function(m) {
          m.distance = $scope.distanceFrom(m.latitude, m.longitude);
        });
      });
    }

    // calculate distance between current location and any lat/lng (in miles)
    $scope.distanceFrom = function(lat, lng) {
      loc = new google.maps.LatLng(lat, lng);
      distanceInMeters = google.maps.geometry.spherical.computeDistanceBetween(loc, $scope.myLocation);
      return distanceInMeters / 1609.34;  // convert to miles
    };


    self.genre = 'All';
    self.distance = 100;
    self.radioModel = 'All';


    $scope.applyFilters = function() {

      $scope.markers = $scope.allMarkers.filter(isFavoriteMatch);
      $scope.markers = $scope.markers.filter(isGenreMatch);
      $scope.markers = $scope.markers.filter(isDistanceMatch);
      if ($scope.markers.length === 0) {
        $scope.flash = "No trucks match your filter criteria";
      } else {
        $scope.flash = '';
      }
      self.pageChanged();
    };

    function isFavoriteMatch(marker) {
      if(self.radioModel == 'All' || !self.loggedInUser) {
        return true;
      }
      else {
        var tmp = self.loggedInUser.trucks;
        for(var i = 0; i < tmp.length; i++) {
          if(tmp[i].id == marker.truck.id) return true;
        }
        return false;
      }
    }

    function isGenreMatch(marker) {
      if(self.genre == 'All') {
        return true;
      } 
      else {
        return marker.truck.genre == self.genre;
      }
    }
    function isDistanceMatch(marker) {
      return marker.distance <= self.distance;
    }

    // /*   Old Trucks controller.  moving it in here */

    // var Truck = $resource('/api/trucks/:id', {id: '@id'});

    // Truck.query(function(data){
    //   self.trucks = data;

    //   self.sixTrucks = self.trucks.slice(0, 6);

    // });

    self.pageChanged = function() {

      var start = (self.currentPage - 1)*6;
      $scope.sixMarkers = $scope.markers.slice(start, start+6);

      if ($scope.sixMarkers.length === 0) {
        d3.select('ul.pager').style({bottom: 0});
      } else if ($scope.sixMarkers.length <= 3) {
        d3.select('ul.pager').style({bottom: '180px'});
      } else {
        d3.select('ul.pager').style({bottom: '275px'});
      }

    };


}
