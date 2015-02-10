angular
  .module('truckApp', ['ngAnimate', 'ui.router', 'templates', 'ngResource'])
  .config(function($stateProvider, $urlRouterProvider){
    $stateProvider
      .state('home', {
        url: '/',
        templateUrl: 'home.html',
        controller: 'HomeController',
        controllerAs: 'home',
        abstract: true
      })
      .state('home.trucks', {
        url: '',
        templateUrl: 'trucks.html',
        controller: 'TruckController',
        controllerAs: 'truck'
      })
      .state('home.truck-detail', {
        url: 'trucks/:truckid',
        templateUrl: 'truck-detail.html',
        controller: 'TruckDetailController',
        controllerAs: 'detail'
      })
      .state('home.truck-graph', {
        url: 'truck-graph',
        templateUrl: 'truck-graph.html',
        controller: 'TruckGraphController',
        controllerAs: 'graph'
      })

  $urlRouterProvider.otherwise('/');
  });