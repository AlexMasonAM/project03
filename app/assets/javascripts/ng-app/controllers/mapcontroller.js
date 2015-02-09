angular.module('truckApp').controller('MapController', function($resource, $interval) {
  var scope = this;
  var center = new google.maps.LatLng(34.0294007,-118.2668506);
  var options = {center: center, zoom: 11, scrollwheel: false};
  this.map = new google.maps.Map(document.getElementById('map-canvas'), options);
  // Get marker information from rails (markers#index)
  // and add them to the map
  Marker = $resource('/markers', {}, {
    query: {method:'GET', isArray:true}
  });
  Marker.query().$promise.then(function(markers) {
    this.markers = markers;
    for(var i = 0; i < markers.length; i++) {
      var latlng = new google.maps.LatLng(markers[i].latitude, markers[i].longitude);
      var m = new google.maps.Marker({position: latlng, map: scope.map});
      scope.markers.push(m);
      var infowindow = new google.maps.InfoWindow(
        { content: "<h1>test</h1><p>"+ markers[i].address +"</p>",
          size: new google.maps.Size(50,50)
        });
      google.maps.event.addListener(m, 'mouseover', (function(marker, infowindow) {
        return function() {
          infowindow.open(scope.map, marker);
        };
      })(m, infowindow));  
      google.maps.event.addListener(m, 'mouseout', (function(infowindow) {
        return function() {
          infowindow.close();
        };
      })(infowindow)); 
    }
  });

  // Get user current location and add it to map
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      currentLocation = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
      new google.maps.Marker({position: currentLocation, map:scope.map, title:"Rami's location"});
    });
  }
  

});