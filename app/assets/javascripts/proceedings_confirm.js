(function() {

    "use strict";

    function ProceedingConfirmController($scope, $filter) {
    }

    ProceedingConfirmController.$inject = ['$scope', '$filter']
    angular.module('proceedingModule',['ui.bootstrap'])
        .controller('ProceedingConfirmController', ProceedingConfirmController);

})();
