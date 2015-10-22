//= require angularjs-validation-option-check
//= require angularjs-file-check
//= require angularjs-ext-button

(function () {
  
  'use strict';

  /**
   * This controller is manage the search.
   *
   * @params [$scope] $scope angularjs $scope object 
   * @params [$filter] $filter angularjs $filter object
   * @params [$modalInstance] $modalInstance angularjs $modalInstance object
   * @params [Object] meetingService angularjs service object
   */
  function MeetingSearchController($scope, $filter, $modalInstance, meetingService) {

    $scope.searchMeetings = []

    $scope.search = function () {

      var req = {};
      req.likeName = $scope.relatedFreeWord || '';
      req.date = $filter('date')($scope.relatedDate, 'yyyy-MM-dd') || '';
      req.kind = $scope.relatedKind || '';

      meetingService.getMeetings(req).success(function (res) {
        $scope.searchMeetings = res;
      });
    };

    $scope.cancel = function () {
      $modalInstance.dismiss('cancel'); 
    };

    $scope.clickSearchMeeting = function (index) {
      $modalInstance.close($scope.searchMeetings[index]);
    };

      $scope.dateOpen = function ($event) {
          $event.preventDefault();
          $event.stopPropagation();

          $scope.opened = true;
      };
  }

  /**
   * This controller is main controller.
   *
   * @params [$scope] $scope angularjs $scope object 
   * @params [$winsow] $winsow angularjs $winsow object
   * @params [$model] $model angularjs $model object
   * @params [Object] meetingService angularjs service object
   */
  function MeetingNewController ($scope, $window, $modal, meetingService) {
    // relational data
    $scope.relational = {
      observers: [],
      participants: [],
      agendas: []
    };
    // all users
    $scope.users = [];

    $scope.kindChange = function (message) {

      var kind_id = $scope.meetingKind;

      $window.confirm(message, function(){
          meetingService.getKindRelation(kind_id).success(function (res) {
              $scope.relational = res.kind;
          });
      });

    };

    $scope.addAgenda = function () {
      $scope.relational.agendas.push({ content: "" });
    };

    $scope.deleteAgenda = function (index) {
      $scope.relational.agendas.splice(index, 1);
    };

    $scope.preSubmitSelect = function () {
      $scope.$broadcast('preSubmit', {});
      //Change div to text area
        angular.element('div#contentedit-agendas').each(function() {
            $(this).replaceWith(function() {
                return '<textarea name="'+$(this).attr("name")+'" rows="3" cols="40">'+$(this).html()+'</textarea>';
            });
        });
    };

    $scope.dateOpen = function ($event) {
      $event.preventDefault();
      $event.stopPropagation();

      $scope.opened = true;
    };

    $scope.open = function () {

      var modalInstance = $modal.open({
        templateUrl: 'meetingSearchDialog.html',
        controller: 'MeetingSearchController',
        size: 'lg',
        resolve: {
          target: function () {
          }
        }
      });

      modalInstance.result.then(function (selectedMeeting) {
        $scope.relatedMeetingId = selectedMeeting.id; 
        $scope.relatedMeetingName = selectedMeeting.name; 
      }, function () {
        // nothing todo
      });

    };

    this.init = function () {
      // get a venus
      meetingService.getVenues().success(function (res) {
        $scope.venues = res;
      });
      // get a all users
      meetingService.getUsers().success(function (res) {
        $scope.users = res;
      });

      $scope.meetingKind = 1;

    };

    // exec initilize
    this.init();

  }

  /**
   * this is base service
   */
  function baseService () {}

  /**
   * get venues
   */
  baseService.prototype.getVenues = function () {
      return this.$http.get('/api/meetings/venue');
  };

  /**
   * get users
   */
  baseService.prototype.getUsers = function () {
      return this.$http.get('/api/users');
  };

  /**
   * get kind relation
   *
   * @params [Integer] kind_id kind id
   */
  baseService.prototype.getKindRelation = function (kind_id) {

      var req = { kind_id: kind_id };
      return this.$http.get('/api/meetings/kind_relation', { params: req });

  };

  /**
   * get meetings
   *
   * @params [Hash] params { freeWord, date, kind }
   */
  baseService.prototype.getMeetings = function (params) {
      return this.$http.get('/api/meetings/search', { params: params });
  };

  meetingService.prototype = Object.create(baseService.prototype);

  /**
   * this is meeting service
   *
   * @params [$http] $http
   */
  function meetingService ($http) {

    this.$http = $http;

  }

  /**
   * This controller is manage the file.
   */
  function FileController () {

    var self = this;

    self.files = [];

    /**
     * add a file of input
     */
    self.addFile = function () {
      self.files.push({});
    };

    /**
     * delete a file of input
     *
     * @params [integer] index index of self.files
     */
    self.deleteFile = function (index) {
      self.files.splice(index, 1);
    };

  }

  MeetingSearchController.$inject = ['$scope', '$filter', '$modalInstance', 'meetingService'];
  MeetingNewController.$inject = ['$scope', '$window', '$modal', 'meetingService'];
  meetingService.$inject = ['$http'];
  FileController.$inject = ['meetingService'];

  angular.module('meetingModule', ['ui.bootstrap', 'validation.optionCheck', 'fileCheck', 'extension.button', 'agendacontent.to.hiddeninput'])
    .service('meetingService', meetingService)
    .controller('MeetingNewController', MeetingNewController)
    .controller('MeetingSearchController', MeetingSearchController)
    .controller('FileController', FileController);

})();
