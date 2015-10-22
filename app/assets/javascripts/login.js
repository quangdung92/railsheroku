(function() {
    'use strict';

    function changeLanguage($window) {
        return {
            link: function (scope, element, attr) {
                element.on('change', function(e) {
                    var language = $(this).val();
                    var current = $window.location.protocol + '//' + $window.location.host + $window.location.pathname;
                    $window.location.href = current + "?locale=" + language;
                });
            }
        };
    }

    changeLanguage.$inject = ['$window'];

    angular.module('LoginModule', ['ui.bootstrap'])
        .directive('ngLanguage', changeLanguage);

})();
