(function() {

  "use strict";

  function baseController() {
  }

  baseController.prototype.getList = function (trigger) {

    var self = this;

    self.service.get("/api/" + self.url, self.setParams(trigger)).success(function (res) {
      self.start_flag = true;
      self.totalItems = res.whats_new_lists.count;
      self.datas = res.whats_new_lists.datas;
    });

  };

  // set the prototype
  WhatsNewListController.prototype = Object.create(baseController.prototype);

  function WhatsNewListController($scope, $filter, $window, whatsNewListService) {

    var self = this;
    var MAX_SIZE = 10;
    var ITEMS_PER_PAGE = 20;
    var TRIGGER = {
      PAGINATION: 0,
      SEARCH: 1
    };
    self.startFlag = false;
    
    self.service = whatsNewListService;
    self.url = "whats_new_lists/get_list_of_whats_new_data";
    self.maxSize = MAX_SIZE;
    self.itemsPerPage = ITEMS_PER_PAGE;
    self.currentPage = 1;

    self.params = {
      likeName: '',
      fromDate: '',
      toDate: '',
      kind: '',
      historyKind: 'all',
      page : 0,
      itemCount : 0
    };
    
    $scope
      .$watch('whatsNewListCtrl.likeName + whatsNewListCtrl.toDate + whatsNewListCtrl.fromDate + whatsNewListCtrl.kind + whatsNewListCtrl.historyKind',
        function () {
          self.getList(TRIGGER.SEARCH);
        }
      );

    $scope.$watch('whatsNewListCtrl.currentPage', function () {
      if (self.start_flag) {
        self.getList(TRIGGER.PAGINATION);
      }
    });

    self.setParams = function (trigger) {
      if (trigger == TRIGGER.PAGINATION) {
        self.params.page = self.currentPage;
      } else if (trigger ==  TRIGGER.SEARCH) {
        self.params.page = 1;
      }
      self.params.itemCount = self.itemsPerPage;
      self.params.likeName = self.likeName || '';
      self.params.fromDate = $filter('date')(self.fromDate, 'yyyy-MM-dd') || '';
      self.params.toDate = $filter('date')(self.toDate, 'yyyy-MM-dd') || '';
      self.params.kind = self.kind || '';
      self.params.historyKind = self.historyKind || '';

      return self.params;
    };

    self.show = function (index) {
      $window.open(self.datas[index].url, '_blank');
    };

    self.clear = function () {
      self.likeName = '';
      self.fromDate = '';
      self.toDate = '';
      self.kind = '';
      self.historyKind = 'all';
    };
      $scope.dateOpen = function ($event,$which) {
          $event.preventDefault();
          $event.stopPropagation();

          $scope[$which] = true;
      };
  }

  function baseService () {}

  baseService.prototype.get = function (url, options) {
    return this.$http.get(url, {params: options});  
  };

  whatsNewListService.prototype = Object.create(baseService.prototype);

  /**
   * @ngInject
   */
  function whatsNewListService($http) {

    this.$http = $http;

  }

  WhatsNewListController.$inject = ['$scope', '$filter', '$window', 'whatsNewListService'];
  whatsNewListService.$inject = ['$http'];

  angular.module('WhatsNewLists', ['ui.bootstrap'])
    .service('whatsNewListService', whatsNewListService)
    .controller('WhatsNewListController', WhatsNewListController);

})();
