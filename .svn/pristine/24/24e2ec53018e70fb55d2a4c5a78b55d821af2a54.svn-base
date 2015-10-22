(function() {

  "use strict";

  function baseController() {
  }

  baseController.prototype.getList = function (trigger) {

    var self = this;

    self.service.get("/api/" + self.url, self.setParams(trigger)).success(function (res) {
      self.start_flag = true;
      self.totalItems = res.meetings.count;
      self.datas = res.meetings.datas;
    });

  };

  baseController.prototype.createDate = function (arg) {
    console.log(arg.trim().length);
    if (arg.trim().length != 0) {
      return new Date(arg);
    }
  };

  // set the prototype
  MeegintListController.prototype = Object.create(baseController.prototype);

  function MeegintListController($scope, $filter, $window, meetingListService) {

    var self = this;
    var MAX_SIZE = 10;
    var ITEMS_PER_PAGE = 20;
    var TRIGGER = {
      PAGINATION: 0,
      SEARCH: 1
    };
    self.startFlag = false;
    
    self.service = meetingListService;
    self.url = "meetings/get_list";
    self.maxSize = MAX_SIZE;
    self.itemsPerPage = ITEMS_PER_PAGE;
    self.currentPage = 1;

    self.params = {
      likeName: '',
      fromDate: '',
      toDate: '',
      kind: '',
      is_completed: 1,
      page : 0,
      itemCount : 0
    };

    $scope
      .$watch('meegintListCtrl.likeName + meegintListCtrl.toDate + meegintListCtrl.fromDate + meegintListCtrl.kind',
        function () {
          self.getList(TRIGGER.SEARCH);
        }
      );

    $scope.$watch('meegintListCtrl.currentPage', function () {
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

      return self.params;
    };

    self.show = function (index) {
      $window.open('/proceedings/' + self.datas[index].proceeding_id, '_blank');
    };

    self.clear = function () {
      self.likeName = '';
      self.fromDate = '';
      self.toDate = '';
      self.kind = '';
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

  meetingListService.prototype = Object.create(baseService.prototype);

  /**
   * @ngInject
   */
  function meetingListService($http) {

    this.$http = $http;

  }

  MeegintListController.$inject = ['$scope', '$filter', '$window', 'meetingListService'];
  meetingListService.$inject = ['$http'];

  angular.module('MeetingLists', ['ui.bootstrap'])
    .service('meetingListService', meetingListService)
    .controller('MeegintListController', MeegintListController);

})();
