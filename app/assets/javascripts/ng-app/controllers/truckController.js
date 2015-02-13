angular
  .module('truckApp')
  .controller('TruckController', function($scope, $resource){
    var self = this;
    var Truck = $resource('/api/trucks/:id', {id: '@id'});

    Truck.query(function(data){
      self.trucks = data;

      self.sixTrucks = self.trucks.slice(0, 6);

    });

    self.pageChanged = function() {
      console.log(self.trucks);
      var start = (self.currentPage - 1)*6;
      self.sixTrucks = self.trucks.slice(start, start+6);
      console.log(self.sixTrucks);
    };


  });