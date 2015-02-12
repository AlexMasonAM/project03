angular.module('truckApp')
  .controller('CheckinController', CheckinController);

function CheckinController($resource, $scope, $stateParams) {

  $scope.marker = {};

  Marker = $resource('/api' + window.location.pathname + '/markers'); 

  $scope.createMarker = function() {
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(pos){
        console.log($stateParams);
        $scope.marker = new Marker({marker:{
          latitude: pos.coords.latitude,
          longitude: pos.coords.longitude,
          end_time: new Date()
        }});
        $scope.marker.$save();
        console.log($scope.marker);
      });
    }
  };

}