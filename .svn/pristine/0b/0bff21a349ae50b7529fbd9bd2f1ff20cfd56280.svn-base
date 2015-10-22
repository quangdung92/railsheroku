(function() {

  "use strict";

  function baseController() {

  }

  baseController.prototype.getList = function () {

    var self = this;

    self.service.get("/api/" + self.url, self.params).success(function (res) {
      self.totalItems = res[0].count;
      self.datas = res[1].datas;
    });

  };

  // set the prototype
  UserListController.prototype = Object.create(baseController.prototype);

  function UserListController($scope, $modal, userService) {

    var self = this;
    var MAX_SIZE = 10;
    var ITEMS_PER_PAGE = 20;
    
    self.service = userService;
    self.url = "admin/users/get_list";
    self.maxSize = MAX_SIZE;
    self.itemsPerPage = ITEMS_PER_PAGE;
    self.params = {
      page : 0,
      itemCount : 0
    };

    $scope.$watch('userList.currentPage', function () {
      self.params.page = self.currentPage;
      self.params.itemCount = self.itemsPerPage;
      self.getList();
    });

    self.currentPage = 1;

  }

  function baseService () {}

  baseService.prototype.get = function (url, options) {
    return this.$http.get(url, {params: options});  
  };

  userService.prototype = Object.create(baseService.prototype);

  /**
   * @ngInject
   */
  function userService($http) {

    this.$http = $http;

  }

  UserListController.$inject = ['$scope', '$modal', 'userService'];
  userService.$inject = ['$http'];

  angular.module('adminModule', ['ui.bootstrap'])
    .service('userService', userService)
    .controller('UserListController', UserListController);

})();
