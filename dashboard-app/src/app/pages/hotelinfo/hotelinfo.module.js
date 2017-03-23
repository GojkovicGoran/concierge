(function () {
    'use strict';

    angular.module('ConciergeApp.pages.hotelinfo', [])
        .config(routeConfig);


    /** @ngInject */
    function routeConfig($stateProvider) {
        $stateProvider
            .state('hotelinfo', {
                url: '/hotelinfo',
                templateUrl: 'app/pages/hotelinfo/hotelinfo.html',
                title: 'Hotel info',
                sidebarMeta: {
                    icon: 'fa fa-info',
                    order: 250
                }
            });
    }

})();
