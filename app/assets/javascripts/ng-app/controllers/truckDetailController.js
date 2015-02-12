angular
  .module('truckApp')
  .controller('TruckDetailController', function($resource, $stateParams){
    var self = this;
    var Truck = $resource('/api/trucks/:id', {id: '@id'});
    Truck.get({id: $stateParams.truckid}, function(truck) {
      self.truck = truck;
    });
  });