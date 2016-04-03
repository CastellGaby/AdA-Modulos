"use strict";
var app = angular.module( 'myapp', [ 'ngRoute', 'ngCookies'] ).controller('initCtr', function($scope, $http){
	$scope.title = "Proyecto";
	$scope.puerto = "22002";

	$scope.activate_tab = function(element){
		var ele = $(element.currentTarget).parent();
		$('nav li').removeClass('active');
		ele.addClass('active');
		var nav = $('.main_nav li');
		$('.side-nav li:eq('+nav.index(ele)+')').addClass('active');
	}

});
