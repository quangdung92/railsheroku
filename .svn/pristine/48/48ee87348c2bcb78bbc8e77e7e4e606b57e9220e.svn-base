(function() {

    "use strict";

    function AdminSettingController($scope,$http) {

        $scope.change_send_mail = function(){
            var check_status = "false";
            if($scope.send_mail){
                check_status = "true";
            }

            // change status on db
            $http.post("/admin/admin_settings/change_status/", { status: check_status}).success(function (res) {

            });

        };

    }

    AdminSettingController.$inject = ['$scope','$http'];

    angular.module('adminSettingModule',['ng-rails-csrf'])
        .controller('AdminSettingController', AdminSettingController);

})();

