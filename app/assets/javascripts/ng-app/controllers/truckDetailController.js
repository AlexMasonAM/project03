angular
  .module('truckApp')
  .controller('TruckDetailController', TruckDetailController);
    TruckDetailController.$inject = ['$resource', '$stateParams', '$http'];
    function TruckDetailController($resource, $stateParams, $http){
    var self = this;
    var Truck = $resource('/api/trucks/:id', {id: '@id'});
    var Favorite = $resource('/api/favorites/:id', {id: '@id'});
    var User = $resource('/api/users/:id', {id: '@id'});

    self.isFavorite = false;

    if(currentUser && currentUser.type == 'User') {
      User.get({id: currentUser.id}, function(data) {
        for(var i = 0; i < data.favorites.length; i++) {
          if($stateParams.truckid == data.favorites[i].truck_id) {
            self.isFavorite = true;
            self.favoriteId = data.favorites[i].id;
            self.post = " saved!";
            Favorite.get({id: self.favoriteId}, function(fav_data) {
              self.fav = fav_data;
            });
            break;
          }
        }
      });
    }

    self.toggleFavorite = function() {
      if(currentUser && currentUser.type == 'User') {
        if(!self.isFavorite) {
          self.fav = new Favorite({
            truck_id: self.truck.id,
            user_id: currentUser.id
          });
          self.fav.$save();
          self.isFavorite = true;
          self.post = " saved!";
          self.pre = '';
        } else {
          self.fav.$delete({id: self.favoriteId});
          self.isFavorite = false;
          self.pre = "Add as ";
          self.post = '';
        }
      }
    };


    Truck.get({id: $stateParams.truckid}, function(truck) {
      self.truck = truck;
      window.currentDetailTruck = truck.name;
      $http.get("/api/yelp/search/" + "?term=" + self.truck.yelp_id).success( function(data,status) {
        self.yelpdata = data;  
      });
    });
  }