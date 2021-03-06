(function () {
    angular.module('ConciergeApp.pages.roomType')
        .factory('RoomTypeService', ['$http', 'SERVER_PATH', function ($http, SERVER_PATH) {
            var saveRoomType = function (roomType, file) {
                if (file) {
                    roomType.image = file.name;
                } else {
                    roomType.image = '';
                }
                var fd = new FormData();
                fd.append('roomType', new Blob([JSON.stringify(roomType)], {
                    type: "application/json"
                }));
                fd.append('image', file);
                return $http({
                    method: 'POST',
                    url: SERVER_PATH.url + '/room-types',
                    data: fd,
                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}
                }).then(function (response) {
                    return response;
                }, function (error) {
                    return error;
                });

            };

            var getImage = function (imageName) {
                return $http({
                    method: 'GET',
                    url: SERVER_PATH.url + '/room-types/image/' + imageName,
                    responseType: "arraybuffer"
                }).then(function (response) {
                    var base64Image = arrayBufferToBase64(response.data);

                        return base64Image;
                   }, function (error) {
                        return error;
                   });
          };

            function arrayBufferToBase64(buffer) {
                var binary = '';
                var bytes = new Uint8Array(buffer);
                var len = bytes.byteLength;
                for (var i = 0; i < len; i++) {
                    binary += String.fromCharCode(bytes[i]);
                }
                  return window.btoa(binary);
            }

            var getAllRoomTypes = function () {
                return $http({
                    method: 'GET',
                    url: SERVER_PATH.url + '/room-types',
                }).then(function (response) {
                    return response;
                }, function (error) {
                    return error;
                });
            };

            var deleteRoomType = function (selectedRoomTypeId) {
                return $http({
                    method: 'DELETE',
                    url: SERVER_PATH.url + '/room-type/' + selectedRoomTypeId,
                }).then(function (response) {
                    return response;
                }, function (error) {
                    return error;
                });
            };

            return {
                saveRoomType: saveRoomType,
                getAllRoomTypes: getAllRoomTypes,
                deleteRoomType: deleteRoomType,
                getImage: getImage
            };
        }])
})();
