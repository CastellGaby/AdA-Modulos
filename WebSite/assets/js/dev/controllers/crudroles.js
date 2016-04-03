"use strict";

app.controller( 'crudrolesCtrl', function($scope, $http, $window ){

    $scope.save=function (){
        var data={ Name: $("#Name").val()
        };

        $http({
            method : "POST",
            url : "http://localhost:22002/api/roles",
            data: data
        }).then(function mySuccess(response) {
            console.log(response);
            $window.location.href ="/roles";
        }, function myError(response) {
            console.log(response);
        });
    }
});



