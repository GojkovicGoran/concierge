(function (){
    angular.module('ConciergeApp.pages.facility')
    .directive('validFile',function(){
        return {
            require:'ngModel',
            link:function(scope,el,attrs,ctrl){
                ctrl.$setValidity('validFile', el.val() != '');
                //change event is fired when file is selected
                el.bind('change',function(){
                    ctrl.$setValidity('validFile', el.val() != '');
                    scope.$apply(function(){
                        ctrl.$setViewValue(el.val());
                        ctrl.$render();
                    });
                });
            }
        }
    });
})();
