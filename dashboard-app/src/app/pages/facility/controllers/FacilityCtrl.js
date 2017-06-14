(function () {
    'use strict';

    angular.module('ConciergeApp.pages.facility')
        .controller('FacilityCtrl', FacilityCtrl);

    FacilityCtrl.$inject = ['FacilityService', '$scope', 'toastr', '$uibModal', '$state', '$window', '$uibModalStack'];
    function FacilityCtrl(FacilityService, $scope, toastr, $uibModal, $state, $window, $uibModalStack) {
        $scope.facility = {};
        $scope.floors = [-2, -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
        $scope.imageSrc = 'assets/img/placeholder.png?_ts=' + new Date().getTime();

        FacilityService.getAllFacilities().then(function (response) {
            $scope.listOfFacility = response.data;
            $scope.rowCollection = response.data;
        }, function (error) {
            console.log(error);
        });

        FacilityService.getFacilityType().then(function (response) {
            $scope.facilityTypes = response.data;
        }, function (error) {
            console.log(error);
        });

        $scope.submit = function (facility) {
            if (facility.$invalid) {
                return;
            }
            FacilityService.saveFacility($scope.facility, $scope.croppedImg).then(function (response) {

                if (response.status === 200) {
                    toastr.success(response.data.facilityName + ' has successfully saved', 'Save Facility');
                    facility.$setPristine();
                    $scope.facility = {};
                    $scope.selectedFacility = null;
                    $state.go('facilityOverview');
                    angular.element("input[type='file']").val(null);
                    $scope.imageSrc = 'assets/img/placeholder.png?_ts=' + new Date().getTime();
                } else {
                    if (response.data.errors) {
                        angular.forEach(response.data.errors, function (value, key) {
                            toastr.error(response.data.errors[key].defaultMessage, 'Error');
                        });
                    } else {
                        toastr.error(response.data.error, 'Error');
                    }
                }
            }, function (error) {
                console.log(error);
            });
        };

        $scope.openImageCrop = function () {
            $scope.element = '#facility-image';
            $uibModal.open({
                templateUrl: 'app/theme/components/crop-image/crop-upload-image.html',
                controller: 'ModalCtrl',
                scope: $scope
            })
        };

        $scope.isImageMissing = function () {
            var image = angular.element('#facility-image').attr('src');
            return image === $scope.imageSrc;
        };

        $scope.openEditableFacilityForm = function () {
            var selectedFacility = JSON.parse($window.localStorage.getItem('editableFacility'));
            $scope.facility = selectedFacility;
            delete $scope.imageSrc;
            var panelImage = angular.element(document.querySelector('#facility-image'));
            panelImage.attr('src',$scope.facility.image);
            $scope.croppedImg = $scope.facility.image;
        };

        $scope.handleEditButton = function (selectedFacility) {
            $window.localStorage.setItem('editableFacility', JSON.stringify(selectedFacility));
            $state.go('facility');
        };

        $scope.handleAddFacilityButton = function () {
            $state.go('facility');
        };

        $scope.handleCancelButton = function () {
            $state.go('facilityOverview')
        };

        $scope.closeFacilityModal = function () {
            $uibModalStack.dismissAll();
        };

        $scope.handleDeleteButton = function (selectedFacility) {
            $scope.selectedFacility = selectedFacility;
            $uibModal.open({
                templateUrl: 'app/pages/facility/views/facility-modal.html',
                controller: 'FacilityCtrl',
                scope: $scope
            });
        };

        $scope.deleteFacility = function (selectedFacility) {

            FacilityService.deleteFacility(selectedFacility.id).then(function (response) {

                if (response.status === 200) {
                    toastr.success(selectedFacility.facilityName + ' has been deleted successfully', 'Delete Facility');

                    $scope.closeFacilityModal();
                    $state.reload();
               } else {
                    toastr.error(selectedFacility.facilityName + ' has not been deleted successfully', 'Delete Facility');
                }
            }, function (response) {
                console.log(response)
            });

            $scope.closeFacilityModal();
        };

        $scope.$on("$stateChangeSuccess", function () {
            if ($state.is('facility') && $window.localStorage.length) {
                $scope.openEditableFacilityForm();
            } else {
                $window.localStorage.clear();
            }
        });
    }
})();
