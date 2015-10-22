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
  KindListController.prototype = Object.create(baseController.prototype);

  function KindListController($scope, $modal, kindService) {

    var self = this;
    var MAX_SIZE = 10;
    var ITEMS_PER_PAGE = 20;
    
    self.service = kindService;
    self.url = "kinds";
    self.maxSize = MAX_SIZE;
    self.itemsPerPage = ITEMS_PER_PAGE;
    self.params = {
      page : 0,
      itemCount : 0
    };

    $scope.$watch('kindList.currentPage', function () {
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

  kindService.prototype = Object.create(baseService.prototype);

  /**
   * @ngInject
   */
  function kindService($http) {

    this.$http = $http;

  }

  KindListController.$inject = ['$scope', '$modal', 'kindService'];
  kindService.$inject = ['$http'];

  angular.module('adminModule', ['ui.bootstrap'])
    .service('kindService', kindService)
    .controller('KindListController', KindListController);

})();
