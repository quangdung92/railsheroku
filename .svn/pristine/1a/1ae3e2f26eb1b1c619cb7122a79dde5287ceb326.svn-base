(function() {
  'use strict';
  // this is controllers
  function InfoController($scope, $filter) {

    var DATE_TRIGGER = {
      FROM: 0,
      TO: 1
    };

    $scope.clear = function () {
      $scope.freeWord = '';
      $scope.fromDate = '';
      $scope.toDate = '';
      $scope.kind = '';
    };

    $scope.$watch('freeWord + fromDate + toDate + kind', function () {

      var data = {};

      data.freeWord = $scope.freeWord || '';
      data.fromDate = $filter('date')($scope.fromDate, 'yyyy-MM-dd') || '';
      data.toDate = $filter('date')($scope.toDate, 'yyyy-MM-dd') || '';
      data.kind = $scope.kind || '';

      $scope.$broadcast('search', data);

    });

    $scope.dateOpen = function ($event, trigger) {
      $event.preventDefault();
      $event.stopPropagation();

      if ( trigger == DATE_TRIGGER.FROM ) {
        $scope.fromOpened = true;
      } else if ( trigger == DATE_TRIGGER.TO ) {
        $scope.toOpened = true;
      }

    };
  }

  function baseController() {
  }

  baseController.prototype.search = function (service, data) {

    var self = this;

    service.get("/api/" + this.url, data).success(function (data) {
      self.datas = data;
    });

  };

  SelfUnresolvedAiController.prototype = Object.create(baseController.prototype);
  MeetingUnresolvedAiController.prototype = Object.create(baseController.prototype);
  ScheduledMeetingController.prototype = Object.create(baseController.prototype);
  EndedMeetingController.prototype = Object.create(baseController.prototype);
  WhatsNewController.prototype = Object.create(baseController.prototype);

  /**
   * @ngInject
   */
  function SelfUnresolvedAiController($scope, homeService) {

    var self = this;
    var service = homeService;
    
    self.url = "unresolved_ai_lists/me";

    $scope.$on('search', function (event, data) {
      self.search(service, data);
    });

  }

  /**
   * @ngInject
   */
  function MeetingUnresolvedAiController($scope, homeService) {

    var self = this;
    var service = homeService;

    self.url = "unresolved_ai_lists/meeting";

    $scope.$on('search', function (event, data) {
      self.search(service, data);
    });

  }

  /**
   * @ngInject
   */
  function ScheduledMeetingController($scope, homeService) {

    var self = this;
    var service = homeService;

    self.url = "meeting_lists/scheduled";

    $scope.$on('search', function (event, data) {
      self.search(service, data);
    });
  }

  /**
   * @ngInject
   */
  function EndedMeetingController($scope, homeService) {

    var self = this;
    var service = homeService;

    self.url = "meeting_lists/ended";

    $scope.$on('search', function (event, data) {
      self.search(service, data);
    });
  }

  function WhatsNewController($scope, homeService) {

    var self = this;
    var service = homeService;

    self.url = "whats_new_lists/get_whats_new_data";

    $scope.$on('search', function (event, data) {
      self.search(service, data);
    });
  }

  function baseService () {}

  baseService.prototype.get = function (url, options) {
    return this.$http.get(url, {params: options});  
  };

  homeService.prototype = Object.create(baseService.prototype);

  /**
   * @ngInject
   */
  function homeService($http) {

    this.$http = $http;

  }

  function formSubmit() {
    return {
      priority: -1,
      link: function (scope, element, attr) {
        element.on('click', function (e) {
          var form = angular.element('#' + attr.formTarget);
          form.attr('action', attr.href);
          form.submit();
          // stop default event
          e.stopImmediatePropagation();
          e.preventDefault();
        });
      }
    };
  }

  InfoController.$inject = ['$scope', '$filter'];
  SelfUnresolvedAiController.$inject = ['$scope', 'homeService'];
  MeetingUnresolvedAiController.$inject = ['$scope', 'homeService'];
  ScheduledMeetingController.$inject = ['$scope', 'homeService'];
  EndedMeetingController.$inject = ['$scope', 'homeService'];
  WhatsNewController.$inject = ['$scope', 'homeService'];
  homeService.$inject = ['$http'];

  // set the controller and the services to module
  angular.module('homeModule', ['ui.bootstrap'])
    .service('homeService', homeService)
    .controller('InfoController', InfoController)
    .controller('SelfUnresolvedAiController', SelfUnresolvedAiController)
    .controller('MeetingUnresolvedAiController', MeetingUnresolvedAiController)
    .controller('ScheduledMeetingController', ScheduledMeetingController)
    .controller('EndedMeetingController', EndedMeetingController)
    .controller('WhatsNewController', WhatsNewController)
    .directive('formSubmit', formSubmit);

})();
