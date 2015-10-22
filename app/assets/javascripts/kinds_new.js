//= require angularjs-validation-option-check
//= require angularjs-ext-button

(function () {

  "use strict";

  function KindNewController($scope, kindService) {
    // relational data
    $scope.relational = {
      observers: [],
      participants: [],
      agendas: []
    };
    // all users
    $scope.users = [];

    $scope.addAgenda = function () {
      $scope.relational.agendas.push({ content: "" });
    };

    $scope.deleteAgenda = function (index) {
      $scope.relational.agendas.splice(index, 1);
    };

    this.init = function () {
      // get a all users
      kindService.getUsers().success(function (res) {
        $scope.users = res;
      });

    };
    // exec initilize
    this.init();
  }

  /**
   * this is base service
   */
  function baseService () {}

  /**
   * get users
   */
  baseService.prototype.getUsers = function () {
      return this.$http.get('/api/users');
  };

  kindService.prototype = Object.create(baseService.prototype);

  /**
   * this is kind service
   *
   * @params [$http] $http
   */
  function kindService ($http) {

    this.$http = $http;

  }

  KindNewController.$inject = ['$scope', 'kindService'];
  kindService.$inject = ['$http'];

  angular.module('adminModule', ['ui.bootstrap', 'validation.optionCheck', 'extension.button'])
    .service('kindService', kindService)
    .controller('KindNewController', KindNewController);

})();
