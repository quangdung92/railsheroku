(function () {
  "use strict";

  function baseController() {
  }

  baseController.prototype.getUsersOfCybozu = function (message) {

    var self = this;

    window.confirm(message, function(){
        self.service.getUsersOfCybozu(self.url, self.params).success(function (res) {
            window.alert(res.response.message.replace(/\\n/g, "\n"), "success");
        });
    });

  };

  CybozuController.prototype = Object.create(baseController.prototype);

  function CybozuController($scope, cybozuService) {

    var self = this;

    self.url = "get_users_of_cybozu";
    self.params = {};
    self.service = cybozuService;

  }

  function baseService () {}

  baseService.prototype.getUsersOfCybozu = function (url, options) {
    return this.$http.get(url, {params: options});  
  };

  cybozuService.prototype = Object.create(baseService.prototype);

  /**
   * @ngInject
   */
  function cybozuService($http) {

    this.$http = $http;

  }

  CybozuController.$inject = ['$scope', 'cybozuService'];
  cybozuService.$inject = ['$http'];

  angular.module('adminModule', ['wc.Directives'])
    .service('cybozuService', cybozuService)
    .controller('CybozuController', CybozuController);

})();
