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
            controller: function($scope) {
              $scope.trucks = ['kogi', 'bbq', 'burgers'];
            }
          })
          .state('home.truck', {
            url: '/truck/:truckid',
            templateUrl: 'truck-detail.html',
            controller: function($scope, $stateParams) {
              $scope.truckid = $stateParams.truckid;
            }
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