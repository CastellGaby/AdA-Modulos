"use strict";app.config(function($routeProvider,$locationProvider){$routeProvider.when("/",{templateUrl:"/views/home",controller:"homeCtrl"}).when("/usuarios",{templateUrl:"/views/usuarios",controller:"usuariosCtrl"}).when("/404",{templateUrl:"/views/404"}).when("/crudusuarios",{templateUrl:"/views/crudusuarios",controller:"crudusuariosCtrl"}).when("/roles",{templateUrl:"/views/roles",controller:"rolesCtrl"}).when("/crudroles",{templateUrl:"/views/crudroles",controller:"crudrolesCtrl"}).otherwise({redirectTo:"/404"}),$locationProvider.html5Mode({enabled:!0,requireBase:!1})});