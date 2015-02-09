angular.module('truckApp').controller('TrucksController', function($resource, $stateParams) {

  var scope = this;
  Truck = $resource('/api/trucks', {}, {
    query: {method:'GET', isArray:true}
  });

  this.trucks = Truck.query();

  //this.truck = Truck.get({truckId: $stateParams.truckid});


});