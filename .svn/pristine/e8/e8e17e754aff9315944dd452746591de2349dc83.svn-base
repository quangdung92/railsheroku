//= require angularjs-ext-button
(function () {

  "use strict";

  //CONST
  var SCROLL_WAIT = 100;
  var KEY_ENTER = 13;


  function baseController() {
  }

  baseController.prototype.getUser = function ($scope) {

    var self = this;

    self.service.get("/api/" + self.url, self.params).success(function (res) {
      $scope.allUserCount = res.length - 1;
      self.users = res;

      self.url = "comments/get_comments_of_proceeding";
      self.params = {
        id : self.proceeding_id 
      };
      self.getComments($scope);
    });

  };

  baseController.prototype.getActionItem = function () {

    var self = this;
    var i = 0;

    self.service.get("/api/" + self.url, self.params).success(function (res) {
      self.action_items = res;
      //for ng-repeat within If you set the complete_date to ng-model of ui-datepicker variable disappears, to set a variable for display
      for(i = 0; i < self.action_items.length; i++){
        self.action_items[i]['completion_date2'] = self.action_items[i].completion_date;
      }
    });

  };

  baseController.prototype.getMaterial = function ($scope, $timeout, scroll_flag) {

    var self = this;

    self.service.get("/api/" + self.url, self.params).success(function (res) {
      self.files = res;
      $scope.files = res;
      if (scroll_flag) {
        //scroll bottom
        $timeout(function(){
          scrollBottom(document.getElementById('upload_files_area'));
        }, SCROLL_WAIT);
      } else {
        //nothing to do
      }
    });

  };

  baseController.prototype.getComments = function ($scope) {

    var self = this;
    var i = 0;

    self.service.get("/api/" + self.url, self.params).success(function (res) {
      //todo set comment
      self.comments = res;
      for(i = 0; i < self.comments.length; i++){
        self.comments[i]['comment_user'] = I18n.t('views.proceedings.comment.js.label.comment_user', {user_name: self.comments[i]['user_name']});
        self.comments[i]['confirmed_comment'] = I18n.t('views.proceedings.comment.js.label.confirmed_comment', {all_user_count: $scope.allUserCount, comment_user_count: self.comments[i]['comment_user_count']});
      }
    });

  };

  baseController.prototype.updateActionItem = function ($scope) {

    var self = this;

    self.service.post("/api/" + self.url, self.params).success(function (res) {
      self.action_items[$scope.edit_action_item_index].completion_date = res[0].completion_date;
    });

  };

  baseController.prototype.clearActionItem = function ($scope) {

    var self = this;

    self.service.post("/api/" + self.url, self.params).success(function (res) {
      self.action_items[$scope.edit_action_item_index].completion_date = res[0].completion_date;
      document.getElementById('action_items_' + $scope.edit_action_item_index + '_completion_date').value = "";
    });

  };

  baseController.prototype.deleteUploadFile = function ($scope) {

    var self = this;
    self.service.post("/materials/" + self.url, self.params).success(function (res) {
      $scope.files.splice($scope.delete_file_index, 1);
    });

  };

  baseController.prototype.writeComment = function ($scope, $timeout) {

    var self = this;
    var length = 0;

    self.service.post("/api/" + self.url, self.params).success(function (res) {  
      self.comments.push(res[0]);
      length = self.comments.length - 1;
      self.comments[length]['comment_user'] = I18n.t('views.proceedings.comment.js.label.comment_user', {user_name: self.comments[length]['user_name']});
      self.comments[length]['confirmed_comment'] = I18n.t('views.proceedings.comment.js.label.confirmed_comment', {all_user_count: $scope.allUserCount, comment_user_count: self.comments[length]['comment_user_count']});
      //clear comment
      $scope.commentContent = "";
      //$timeout(function(){
      //  //scrollBottom(document.getElementById('comments_area'));
      //    //scroll to new comment and fill color
      //    var e = document.getElementById('comment_' + res[0]['id']);
      //    e.style.backgroundColor = "lightcyan";
      //    e.scrollIntoView();
      //}, SCROLL_WAIT);
    });

  };

  baseController.prototype.confirmComment = function ($scope, id) {

    var self = this;
    self.service.post("/api/" + self.url, self.params).success(function (res) {
      //reload comments
      self.url = "comments/get_comments_of_proceeding";
      self.params = {
        id : self.proceeding_id 
      };
      self.getComments($scope);
      //todo 他ユーザにコメントの書き込みを通知する
    });

  };

  // set the prototype
  ProceedingShowController.prototype = Object.create(baseController.prototype);
  FileController.prototype = Object.create(baseController.prototype);
  CommentController.prototype = Object.create(baseController.prototype);


  function ProceedingShowController($scope, proceedingService, $modal, $filter) {
    var self = this;
    self.service = proceedingService;
    self.action_items = [];
    self.proceeding_id;

      // relational data
      $scope.relational = {
          observers: []
      };
      // all users
      $scope.users = [];

      var from_user = {
          observers : []
      };

      var to_user = {
          observers : []
      };
    $scope.init = function (proceeding_id,observers) {
      self.proceeding_id = proceeding_id;
        //init observers
        $scope.relational.observers = observers;
      // get ai
      self.url = "action_items/get_action_items_of_proceeding";
      self.params = {
        id : proceeding_id 
      };
      self.getActionItem();
      $scope.proceeding_id = proceeding_id;
    };


    $scope.completeActionItem = function (index) {
      $scope.edit_action_item_index = index;
      var completion_date = document.getElementById('action_items_' + index + '_completion_date').value;
      //check input
      if (trim(completion_date).length <= 0){
        alert(I18n.t('views.proceedings.show.js.alert.please_input_completion_date'));
      //check not edit
      } else if (self.action_items[index].completion_date == completion_date) {
        //nothing to do
      } else {
        self.url = "action_items/update_completion_date_of_action_item";
        self.params = {
          action_item_id : self.action_items[index].id,
          user_id : self.action_items[index].user_id,
          completion_date : completion_date,
        }
        // update action item
        self.updateActionItem($scope);
      };
    };

    $scope.completeClearActionItem = function (index) {

      confirm(I18n.t('views.proceedings.show.js.confirm.ai_completion_date_clear'), function(){
          $scope.edit_action_item_index = index;
          self.url = "action_items/clear_completion_date_of_action_item";
          self.params = {
              action_item_id : self.action_items[index].id
          }
          self.clearActionItem($scope);
      });
    };

    //After Responce Function
      $scope.openedCompleteDate = [];
      $scope.dateOpen = function ($event,$which) {
        $event.preventDefault();
        $event.stopPropagation();

        for (var i in $scope.openedCompleteDate)$scope.openedCompleteDate[i] = false;
        $scope.openedCompleteDate[$which] = true;
      };

      // Edit Observer
      $scope.editObservers = function(){
          // get a all users
          self.service.getUsers().success(function (res) {
              $scope.users = res;
          });
          $scope.success = false;
          //console.log($scope.relational.observers);
          var modalInstance = $modal.open({
              animation: $scope.animationsEnabled,
              templateUrl: 'editObserverDialog.html',
              controller: 'ModalInstanceCtrl',
              size: 'lg',
              scope: $scope,
              resolve: {
                  target: function () {
                  }
              }
          });

      };

      $scope.updateObserver = function () {
          var observerIds = [];
          var observerNames = [];
          for (var i = 0; i < $scope.relational.observers.length; i++) {
              observerIds.push($scope.relational.observers[i].id);
              observerNames.push($scope.relational.observers[i].name);
          }

          var params = { proceeding_id : self.proceeding_id,
                         observer_id : observerIds
                        };
          self.service.post("/api/observers/update_observer/", params).success(function (res) {
              $scope.success = res.success;
              if($scope.success){
                var observers = angular.element('#observers_name');
                var str_observer = observerNames.join(" , ");
                  if(str_observer != ""){
                      observers.html(str_observer);
                  }else{
                      observers.html("");
                  }
              }
          });
      };


  }
  function ModalInstanceCtrl($scope,$modalInstance){

      $scope.cancel = function () {
          $modalInstance.dismiss('cancel');
          $scope.success = false;
      };
  }

  function FileController($scope, $timeout, FileUploader, proceedingService) {
    var self = this;
    self.service = proceedingService;
    self.files = [];
    self.uploding = false;

    //file uploader sething 
    var csrf_token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    var uploader = $scope.uploader = new FileUploader({url: '/materials/upload', headers: {'X-CSRF-TOKEN': csrf_token}});

    uploader.onBeforeUploadItem = function() {
      $scope.uploding = true;
    }; 

    uploader.onCompleteItem = function(fileItem, response, status, headers) {
      $scope.uploding = false;
      self.url = "materials/get_materials_of_proceeding";
      self.params = {
        id : self.proceeding_id
      };
      self.getMaterial($scope, $timeout, true);
      //clear
      $scope.fileAnnotation = "";
      document.getElementById("uploadfile").value = "";
      $scope.uploader.clearQueue();

      angular.element('#filename').val('');
      angular.element('#fileUpload').modal('hide');
      alert(I18n.t('views.proceedings.file.js.alert.file_upload_success'), 'success');
    };

    uploader.onErrorItem = function(fileItem, response, status, headers) {
      $scope.uploding = false;
      alert(I18n.t('views.proceedings.file.js.alert.file_upload_error'));
    };
    //file uploader sething end 

    $scope.init = function (proceeding_id) {
      self.proceeding_id = proceeding_id;
      self.url = "materials/get_materials_of_proceeding";
      self.params = {
        id : proceeding_id 
      };
      self.getMaterial($scope, $timeout, false);
    };

    //File
    $scope.addFile = function() {
      var files = document.getElementById("uploadfile").files;
      var upload_file = $scope.uploader.queue[$scope.uploader.queue.length - 1];
      var annotation = $scope.fileAnnotation;
      var flg = false;
      if (files[0] == void 0){
        alert(I18n.t('views.proceedings.file.js.alert.please_select_upload_file'));
        return;
      }
      if (annotation == void 0) {
        alert(I18n.t('views.proceedings.file.js.alert.please_input_annotation'));
        return;
      }
      if (trim(annotation).length ==  0) {
        alert(I18n.t('views.proceedings.file.js.alert.please_input_annotation'));
        return;
      }
      //file name check
      angular.forEach($scope.files, function(a_file){
        if (upload_file['file']['name'] == a_file.file_name) {
          //remove upload file
          alert(I18n.t('views.proceedings.file.js.alert.same_file_name'));
          flg = true;
          return;
        }
      });
      //file name confrict
      if (flg) {
        return;
      }
      upload_file.formData.push({
        proceeding_id : self.proceeding_id,
        annotation : $scope.fileAnnotation
      });
      upload_file.upload();
    };
 
    $scope.deleteFile = function(index) {
      var filename = "";

      $scope.delete_file_index = index;
      $scope.files = self.files;
      filename = $scope.files[index].file_name;

      confirm(I18n.t('views.proceedings.file.js.confirm.delete_file', {filename: filename}), function(){
          self.url = "delete"
          self.params = {
              id : $scope.files[index].id
          };
          self.deleteUploadFile($scope);
      });
    };

  }

  function CommentController($scope, $timeout, proceedingService) {
    var self = this;
    self.comments = [];
    self.service = proceedingService;
    self.users = [];

    $scope.init = function (proceeding_id, show_user_id) {
      self.proceeding_id = proceeding_id;
      self.show_user_id = show_user_id;

      self.url = "users/get_list_of_proceeding_relation_user";
      self.params = { proceeding_id: proceeding_id};
      self.getUser($scope);
    };

    $scope.writeComment = function () {
      if (trim($scope.commentContent).length <= 0) {
        alert(I18n.t('views.proceedings.comment.js.alert.please_input_comment'));
      } else {
        self.url = "comments/create_comment";
        self.params = {
          proceeding_id : self.proceeding_id,
          user_id : self.show_user_id,
          content : $scope.commentContent
        };
        self.writeComment($scope, $timeout);
      }
    };

    $scope.keyDownComment = function (event) {
      //keyDownShiftAndEnterWhen
      if ((event.which == KEY_ENTER) && (event.shiftKey)) {
        //nothing to do(new line)
      } else if (event.which == KEY_ENTER) {
        $scope.writeComment();
        //In order to remove the newline after the comment enter
        event.preventDefault();
      } else {
        //nothing to do
      }
    };

    $scope.confirmComment = function (id) {
      self.url = "viewers/confirm_comment";
      self.params = {
        comment_id : id,
        user_id : self.show_user_id
      };
      self.confirmComment($scope, id);
    };

  }

    function jumpToComment($location, $anchorScroll) {
        return function(scope) {
            if (scope.$last) setTimeout(function(){ //wait for comments loaded
                var specified_comment_id = $location.search()['comment'];//search comment id param on link

                if (specified_comment_id) {
                    var id = 'comment_' + specified_comment_id;
                    $location.hash(id);
                    angular.element('#' + id).css('background-color','lightcyan');
                    $anchorScroll();
                    //$location.search = {};//remove params
                    $location.hash('');
                } else {
                    //find and scroll to first comment unconfirmed id
                    $location.hash(angular.element('.btn-confirm').first().parent().parent().attr('id'));
                    $anchorScroll();
                    $location.hash('');
                }
            }, 1);
        };
    }

    function jumpToAi($location, $anchorScroll) {
        return function(scope) {
            if (scope.$last) setTimeout(function(){ //wait for A/I list loaded
                var specified_ai_id = $location.search()['ai'];//search A/I id param on link
                if (specified_ai_id) {
                    var id = 'ai_' + specified_ai_id;
                    $location.hash(id);
                    angular.element('#' + id).css('background-color','lightcyan');
                    $anchorScroll();
                    //$location.search = {};//remove params
                    $location.hash('');
                }
            }, 1);
        };
    }

  function baseService () {}

  baseService.prototype.get = function (url, options) {
    return this.$http.get(url, {params: options});  
  };

  baseService.prototype.post = function (url, formData) {
   return this.$http.post(url, {params: formData});  
  };

  baseService.prototype.delete = function (url) {
   return this.$http.delete(url);  
  };

    /**
     * get users
     */
    baseService.prototype.getUsers = function () {
        return this.$http.get('/api/users');
    };

  proceedingService.prototype = Object.create(baseService.prototype);
  fileService.prototype = Object.create(baseService.prototype);

  /**
   * @ngInject
   */
  function proceedingService($http) {

    this.$http = $http;

  }

  function fileService($http) {

    this.$http = $http;

  }

  function fileCheck ($window) {

    return {
      restrict: 'A',
      link: function (scope, element, attrs) {
        function checkType(file) {
        //if (file.type != 'application/pdf') {
          if (file.name.substr(file.name.lastIndexOf('.') +1).toUpperCase() != "PDF") {
            $window.alert(attrs.warningMessage, 'warning');
          }

        }

        function checkUniqe(file) {

          var flag = true;
          
          angular.forEach(scope.files, function(a_file){
            if (file.name == a_file.file_name) {
              //remove upload file
              scope.uploader.clearQueue();
              flag = false;
              return false;
            }
          });

          if (flag == false) {
            $window.alert(attrs.errorMessage);
            element.val('');
          }

          return flag;

        }

        element.on('change', function (e) {
          angular.element('#filename').val('');
          var file = e.target.files[0];

          if (file != void 0) {
            if (checkUniqe(file)) {
              checkType(file);
              angular.element('#filename').val(file.name);
            } 
          } else {
            //remove upload file
            scope.uploader.clearQueue();
          }
        });
      }
    };

  }

  //user function
  function trim(str) {
    if (str == void 0) {
      str = "";
    } else {
      str =  str.replace(/(^\s+)|(\s+$)/g, "");
      str  = str.replace(/(^[\s　]+)|([\s　]+$)/g, "");
    }
    return str;
  }

  function scrollBottom(em) {
    if (em == void 0) {
      return;
    } else {
      em.scrollTop = em.scrollHeight;
    }
  }

  ProceedingShowController.$inject = ['$scope', 'proceedingService', '$modal','$filter'];
  ModalInstanceCtrl.$inject = ['$scope','$modalInstance'];
  FileController.$inject = ['$scope', '$timeout', 'FileUploader', 'proceedingService'];
  CommentController.$inject = ['$scope', '$timeout', 'proceedingService'];
  proceedingService.$inject = ['$http'];
  fileCheck.$inject = ['$window'];
  jumpToComment.$inject = ['$location', '$anchorScroll'];
  jumpToAi.$inject = ['$location', '$anchorScroll'];

  angular.module('proceedingModule', ['ui.bootstrap', 'angularFileUpload', 'ng-rails-csrf', 'ngSanitize','extension.button'])
    .service('proceedingService', proceedingService)
    .controller('ProceedingShowController', ProceedingShowController)
    .controller('ModalInstanceCtrl', ModalInstanceCtrl)
    .controller('FileController', FileController)
    .controller('CommentController', CommentController)
    .directive('fileCheck', fileCheck)
    .directive('jumpToComment', jumpToComment)
    .directive('jumpToAi', jumpToAi);

})();
