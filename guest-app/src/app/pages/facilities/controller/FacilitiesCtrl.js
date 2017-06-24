(function () {
    'use strict';

    angular.module('GuestApp.pages.facilities').controller('FacilitiesCtrl', FacilitiesCtrl);

    FacilitiesCtrl.$inject = ['$scope', 'FacilitiesService', 'HomeService'];
    function FacilitiesCtrl($scope, FacilitiesService, HomeService) {

        $scope.message = '';

        HomeService.getHotel().then(function (response) {
            if (response.data) {
                $scope.hotel = response.data;
                var logo = angular.element(document.querySelector('.logo-img'));
                logo.attr('src', $scope.hotel.imageLogo);
            } else {
                console.log('Hotel not found')
            }
        }, function (error) {
            console.log(error);
        });

        FacilitiesService.getAllFacilities().then(function (response) {
            if (response.data) {
                $scope.listOfFacilities = response.data;
                var image = angular.element(document.querySelector('.facility-image'));
            } else {
                $scope.message = 'not available';
            }
        }, function (error) {
            console.log(error);
        });

        $scope.getMoreDetails = function (facilityName) {
            if ($scope.selectedFacilityName != facilityName) {
                $scope.selectedFacilityName = facilityName;
            } else $scope.selectedFacilityName = 'false';
        };

    }

})();