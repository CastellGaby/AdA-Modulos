"use strict";

app.controller( 'rolesCtrl', function( $scope, $http) {
    $http.get('http://localhost:22002/api/roles')
        .then(function (response) {
            $scope.data = response.data;
        });
});
