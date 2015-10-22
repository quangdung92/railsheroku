(function () {
  "use strict";

  function baseController() {
  }

  baseController.prototype.testConnect = function (message) {

    var self = this;

    self.params = {
      url: self.url,
      login_id: self.loginId,
      password: self.password
    };

    if (angular.element('form')[0].checkValidity() == false) {
      self.window.alert(message);
      return false;
    }

    self.service.testConnectOfCybozu(self.targetUrl, self.params).success(function (res) {
      if (res.response.error_no == '0') {
        self.window.confirm(res.response.message.replace(/\\n/g, "\n"), function(){
            angular.element('form').submit();
        });
      } else {
        self.window.alert(res.response.message);
      }
    });

  };

  CybozuController.prototype = Object.create(baseController.prototype);

  function CybozuController($scope, $window, cybozuService) {

    var self = this;

    self.targetUrl = "/admin/cybozus/test_connect";
    self.params = {};
    self.window = $window;
    self.service = cybozuService;

  }

  function baseService () {}

  baseService.prototype.testConnectOfCybozu = function (url, options) {
    return this.$http.post(url, {cybozu: options});  
  };

  cybozuService.prototype = Object.create(baseService.prototype);

  /**
   * @ngInject
   */
  function cybozuService($http) {

    this.$http = $http;

  }

  CybozuController.$inject = ['$scope', '$window', 'cybozuService'];
  cybozuService.$inject = ['$http'];

  angular.module('adminModule', ['confirm.click', 'ng-rails-csrf'])
    .service('cybozuService', cybozuService)
    .controller('CybozuController', CybozuController);

})();
