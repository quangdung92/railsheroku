/**
 * @fileoverview This module is extension.button.
 * This module has two directives.
 * Details are written at each head of directives.
 *
 * @author s-kudo@grooovyware.jp(Syuji Kudo)
 */
'use strict';

angular.module('extension.button', []);

angular.module('extension.button')
  .directive('addButton', addButton)
  .directive('deleteButton', deleteButton)
.directive('addUnregisteredButton', addUnregisteredButton);

addButton.$inject = ['$filter'];
deleteButton.$inject = ['$filter'];
addUnregisteredButton.$inject = ['$filter'];

/**
 * It copys the selected value of the selectbox from the from-users to the to-users
 *
 * example:
 *  <js>
 *  angular.module('{your_module}', ['extension.button']);
 *
 *  <html>
 *  <button type="button" from-users="" to-users="" selectbox="" add-button>
 *    from-users = From users
 *    to-users = To users
 *    selectbox = Target selectbox
 */
function addButton ($filter) {
  return {
    scope: {
      fromUsers: "=",
      toUsers: "=",
      selectbox: "="
    },
    link: function (scope, element, attr) {

      var selected_users = [];

      element.on('click', function () {
        if (angular.isUndefined(scope.selectbox)) {
          return false;
        }
        selected_users = scope.selectbox;
        scope.$apply(addUser());
      });

      function addUser () {

        if (selected_users.length) {
          for (var i = 0, j = selected_users.length; i < j; i++ ) {
            var obj;
            var result;

            obj = $filter('filter')(scope.fromUsers, { id: selected_users[i] }, true);
            result = $filter('filter')(scope.toUsers, { id: obj[0].id }, true);

            if (!result.length) {
              scope.toUsers = scope.toUsers.concat(obj);
            }
          }
            selected_users = [];
            scope.selectbox = [];
        }
      }
    }
  };
}

/**
 * It deletes the selected value of the selectbox from the observers or participants.
 *
 * example:
 *  <js>
 *  angular.module('{your_module}', ['extension.button']);
 *
 *  <html>
 *  <button type="button" users="" selectbox="" delete-button>
 *    users = Check target
 *    selectbox = Traget Selectbox
 */
function deleteButton ($filter) {
  return {
    scope: {
      users: "=",
      selectbox: "="
    },
    link: function (scope, element, attr) {

      var selected_users = [];

      element.on('click', function () {
        if (angular.isUndefined(scope.selectbox)) {
          return false;
        }
        selected_users = scope.selectbox;
        scope.$apply(deleteUser());
      });

      function deleteUser() {
        var tmp;

        if (selected_users.length) {
          tmp = scope.users;
          scope.users = [];
          for (var i = 0, j = selected_users.length; i < j; i++ ) {
            tmp = tmp.filter(function (p) {
              return p.id != selected_users[i];
            });
            selected_users[i] = null;
          }
          scope.users = tmp;
          selected_users = [];
        }
      };
    }
  };

}


/**
 * Add a string from-users to to-users
 *
 * example:
 *  <js>
 *  angular.module('{your_module}', ['extension.button']);
 *
 *  <html>
 *  <button type="button" from-users="" to-users="" selectbox="" add-unregistered-button>
 *    from-users = From users
 *    to-users = To users
 */
function addUnregisteredButton ($filter) {
    return {
        scope: {
            fromUsers: "=",
            toUsers: "="
        },
        link: function (scope, element, attr) {

            element.on('click', function () {
                if (angular.isUndefined(scope.fromUsers)) {
                    return false;
                }
                scope.$apply(addUnregisteredUser());
            });

            function addUnregisteredUser () {
                var new_user = scope.fromUsers;
                var user_list = scope.toUsers.split(',');
                if(scope.toUsers.length==0)user_list = [];//empty string, empty array; split() return non-empty array
                if (new_user.length) {
                    var need_to_add = true;
                    for(var i=0; i < user_list.length; i++) {
                        if(new_user==user_list[i]){
                            need_to_add = false;
                            break;
                        }
                    }
                    if(need_to_add){
                        user_list.push(new_user);
                    }
                    scope.toUsers = user_list.join();
                    scope.fromUsers = '';
                }
            }
        }
    };
}