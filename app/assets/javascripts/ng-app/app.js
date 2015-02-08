angular
    .module('truckApp', [
      'ngAnimate',
      'ui.router',
      'templates',
      'ngResource'
    ])
    .config(function($stateProvider, $urlRouterProvider){

      $stateProvider
        .state('home', {
          url: '/',
          templateUrl: 'home.html',
          controller: function($scope) {
            $scope.stuff = ['a', 'b', 'c'];
          }
        });

        $urlRouterProvider.otherwise('/');

    });