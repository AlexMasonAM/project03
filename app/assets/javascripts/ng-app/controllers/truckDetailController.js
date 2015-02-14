angular
  .module('truckApp')
  .controller('TruckDetailController', function($resource, $stateParams, $http){
    var self = this;
    var Truck = $resource('/api/trucks/:id', {id: '@id'});
    // console.log("TRUCK ID:")
    // console.log($stateParams.truckid)
    Truck.get({id: $stateParams.truckid}, function(truck) {
      console.log(truck)
      self.truck = truck;
      console.log(self.truck.name);
      $http.get("/api/yelp/search/" + "?term=" + self.truck.yelp_id).success( function(data,status) {
        self.yelpdata = data  
        console.log(self.yelpdata)
      });
      // self.getDate = function(date) {
      //   var newDate = new Date(date*1000);
      //   return newDate;
      // };
    });
  });