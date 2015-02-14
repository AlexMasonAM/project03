angular.module('truckApp')
  .controller('CheckinController', CheckinController);
CheckinController.$inject = ['$resource', '$stateParams', '$scope'];
function CheckinController($resource, $stateParams, $scope) {

  // default of 4 hours for check-in form
  $scope.hours = 4;

  Marker = $resource('/api' + window.location.pathname + '/markers'); 

  $scope.createMarker = function() {
    if(navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(pos){
        console.log($stateParams);
        $scope.marker = new Marker({marker:{
          latitude: pos.coords.latitude,
          longitude: pos.coords.longitude,
          end_time: getEndTime()
        }});
        $scope.marker.$save();
        console.log($scope.marker);
      });
    }
  };

  function getEndTime() {
    d = new Date();
    d.setHours(d.getHours()+$scope.hours);
    console.log(d);
    return d;
  }

}