"use strict";app.controller("usuariosCtrl",function($scope,$http,$location){$http.get("http://localhost:22002/api/users").then(function(response){$scope.data=response.data}),$scope.UserId=0,$scope.navigate=function(UserId){$scope.UserId=UserId,$location.path("/crudusuarios")}});