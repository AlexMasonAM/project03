angular
  .module('truckApp')
  .controller('TruckDetailController', TruckDetailController);
    TruckDetailController.$inject = ['$resource', '$stateParams', '$http'];
    function TruckDetailController($resource, $stateParams, $http){
    var self = this;
    var Truck = $resource('/api/trucks/:id', {id: '@id'});
    Truck.get({id: $stateParams.truckid}, function(truck) {
      self.truck = truck;
      console.log(self.truck.name);
      $http.get("/api/yelp/search/" + "?term=" + self.truck.name).success( function(data,status) {
      self.yelpdata = data;  
      });
    });
  }