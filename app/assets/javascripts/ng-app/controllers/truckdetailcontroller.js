angular.module('truckApp').controller('TruckDetailController', function($resource, $stateParams) {
    var scope = this;
  Truck = $resource('/api/trucks/:truckId', {truckId: '@id'}, {
    get: {method:'GET'}
  });

  this.truck = Truck.get({truckId: $stateParams.truckid});

});