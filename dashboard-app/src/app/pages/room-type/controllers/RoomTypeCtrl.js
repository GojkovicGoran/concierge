(function () {
    'use strict';
    angular.module('ConciergeApp.pages.roomType')
        .controller('RoomTypeCtrl', RoomTypeCtrl);

    RoomTypeCtrl.$inject = ['BedTypeService', 'FeatureService', 'RoomTypeService', '$scope', 'toastr'];
    function RoomTypeCtrl(BedTypeService, FeatureService, RoomTypeService, $scope, toastr) {

        $scope.roomType = {};
        $scope.selected = [];
        $scope.imageSrc = 'assets/img/placeholder.png?_ts=' + new Date().getTime();


        BedTypeService.getBedTypes().then(function (response) {
            $scope.beds = response.data;
        }, function (error) {
            console.log(error);
        });

        FeatureService.getFeatures().then(function (response) {
            $scope.listOfFeatures = response.data;
        }, function (error) {
            console.log(error);
        });

        $scope.toggleSelection = function (feature) {
            var index = $scope.selected.indexOf(feature);

            if (index === -1) {
                $scope.selected.push(feature);
            } else {
                $scope.selected.splice(index, 1);
            }
            $scope.roomType.features = $scope.selected;
        };

        $scope.getFileSystem = function () {
            var fileInput = document.getElementById('upload-image');
            fileInput.click();
        };

        $scope.submit = function (roomTypeForm) {
            if (roomTypeForm.$invalid) {
                return;
            }
            RoomTypeService.saveRoomType($scope.roomType, $scope.roomType.image).then(function (response) {
                if (response.status === 200 && response.data) {
                    toastr.success(response.data.name + ' has been saved successfully', 'Save Room type');
                    roomTypeForm.$setPristine();
                    roomTypeForm.$setUntouched();
                    $scope.roomType = {};
                    $scope.featureBox = false;
                    angular.element("input[type='file']").val(null);
                    $scope.imageSrc = 'assets/img/placeholder.png?_ts=' + new Date().getTime();

                } else {
                    toastr.error(response.data.name + ' has not been saved successfully', 'Save Room type');
                }
            }, function (error) {
                console.log(error);
            })
        }

    }
})();
