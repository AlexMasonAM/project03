angular
  .module('truckApp')
  .controller('HomeController', function($resource){
    var self = this;


    // Map initialization
    var center = new google.maps.LatLng(34.0294007, -118.2668506);
    var options = {center: center, zoom: 11, scrollwheel: false};
    self.map = new google.maps.Map(document.getElementById('map-canvas'), options);

    // Marker resource
    Marker = $resource('/api/markers', {}, {
      query: {method:'GET', isArray:true}
    });

    // Get markers and save and add them to map.  Also add info windows
    Marker.query().$promise.then(function(markers) {
      self.markers = markers;

      for(var i = 0; i < markers.length; i++) {
        var loc = new google.maps.LatLng(markers[i].latitude, markers[i].longitude);
        var m = new google.maps.Marker({position: loc, map: self.map});
        var content = "<h1>" + markers[i].truck['name'] + "</h1>Near:<br><p>"+ markers[i].address +"</p><p> until " + (markers[i]['end_time'].match(/\d\d:\d\d:\d\d/)) + "</p>";
        var infowindow = new google.maps.InfoWindow({content: content});

        google.maps.event.addListener(m, 'mouseover', (function(marker, infowindow){
          return function() {
            infowindow.open(self.map, marker);
          };
        })(m, infowindow));

        google.maps.event.addListener(m, 'mouseout', (function(infowindow){
          return function() {
            infowindow.close();
          };
        })(infowindow));
      }
    });

  });


  // GEOLOCATION CODE.  keeping for reference
  // if(navigator.geolocation) {
  //   navigator.geolocation.getCurrentPosition(function(position) {
  //     currentLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
  //     new google.maps.Marker({position: currentLocation, map:scope.map, title:"Rami's location"});
  //   });
  // }