angular
  .module('truckApp')
  .controller('TruckGraphController', function($resource){
    var self = this;

    //get all trucks from api/trucks
    TruckFavorite = $resource('/api/trucks', {}, {
      query: {method:'GET', isArray:true}
    });
    
    //filter through api/trucks index for favorites arranged by trucks
    TruckFavorite.query(function(trucks) {
      self.trucks = trucks;


      self.trucks.forEach(function(d,i) {
        var scale = d3.scale.linear()
          .domain([0, trucks.length])
          .range(["lightblue", "cyan"]);
        d.color = scale(i);
        // d.color = "lightblue";
        var users = d.users;
        d.users = [];
        users.forEach(function(u){
          d.users.push(u.first_name + " " + u.last_name[0]);
        });
      });
      TrucksGraphCreate(self.trucks);
    });


    //filter through api/trucks index for favorites arranged by users
    UserFavorite = $resource('/api/users', {}, {
      query: {method:'GET', isArray:true}
    });

    UserFavorite.query(function(users) {
      self.users = users;

      self.users.forEach(function(d) {
        var trucks = d.trucks;
        d.trucks = [];
        trucks.forEach(function(t){
          d.trucks.push(t.name);
        });
      });
      console.log(self.users);  
    });


    //use filtered data in D3   
    self.data = TruckFavorite.query();
  
  });
