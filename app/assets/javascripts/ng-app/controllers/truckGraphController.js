angular
  .module('truckApp')
  .controller('TruckGraphController', TruckGraphController);
    
    TruckGraphController.$inject = ['$resource', '$scope'];
    function TruckGraphController($resource, $scope){
    var self = this;

    //get all trucks from api/trucks
    TruckFavorite = $resource('/api/trucks', {}, {
      query: {method:'GET', isArray:true}
    });
    
    //filter through api/trucks index for favorites arranged by trucks
    TruckFavorite.query(function(trucks) {
      self.trucks = trucks;
      window.trucks = trucks;


      self.trucks.forEach(function(d,i) {
        //assigns color within a range
        var scale = d3.scale.linear()
          .domain([0, trucks.length])
          .range(["#2ECCFA", "#2E9AFE"]);
        d.color = scale(i);

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
      window.users = users;

      self.users.forEach(function(d,i) {
        //assigns color within a range
        var scale = d3.scale.linear()
          .domain([0, users.length])
          .range(["#2ECCFA", "#2E9AFE"]);
        d.color = scale(i);

        var trucks = d.trucks;
        d.trucks = [];
        trucks.forEach(function(t){
          d.trucks.push(t.name);
        });
      });
      console.log(self.users)
      // UsersGraphCreate(self.users);  
    });

  }
