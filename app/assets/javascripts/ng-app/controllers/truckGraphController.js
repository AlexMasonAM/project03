angular
  .module('truckApp')
  .controller('TruckGraphController', function($resource){
    var self = this;

    //get all trucks from api/trucks
    TruckFavorite = $resource('/api/trucks', {}, {
      query: {method:'GET', isArray:true}
    });
    
    //filter through api/trucks index for favorites arranged by truck
    TruckFavorite.query(function(trucks) {
      self.trucks = trucks;
      self.truckUsers = [];
      for(var i = 0; i < trucks.length; i++) {
        var tf = trucks[i].users.first_name;
        console.log(trucks[i].users);
        self.truckUsers.push(tf);
      }
    });

    // //filter through api/users index for favorites arranged by user





    //use filtered data in D3   
    self.data = TruckFavorite.query();
  
  });

        // @trucks.each do |truck|
        // a = {name: truck.truck_name, users: []}
        // json_array_truck_users << a

        // truck.users.each do |user|
        //   a[:users] << user.user_name
        // end