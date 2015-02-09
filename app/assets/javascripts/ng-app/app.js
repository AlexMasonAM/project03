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
          abstract: true,
          url: '/',
          templateUrl: 'home.html',
          controller: 'MapController'
        })
          .state('home.trucks', {
            url: '',
            templateUrl: 'trucks.html',
            controller: 'TrucksController',
            controllerAs: 'trucks'
          })
          .state('home.truck', {
            url: '/trucks/:truckid',
            templateUrl: 'truck-detail.html',
            controller: 'TruckDetailController',
            controllerAs: 'truck'
          })
          .state('home.d3', {
            url: '/data',
            templateUrl: 'data.html',
            controller: function($scope) {
              $scope.data = [1, 2, 3];
            }
          });

        $urlRouterProvider.otherwise('/');

    });