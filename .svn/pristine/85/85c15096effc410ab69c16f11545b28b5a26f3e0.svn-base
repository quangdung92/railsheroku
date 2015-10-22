/**
 * @fileoverview This module is confirm.click.
 * Show a confirmation mesage when a element is clicked.
 *
 * example:
 *  <js>
 *  angular.module('{your_module}', ['confirm.click']);
 *
 *  <html>
 *  <button type="button" confimrm-click confirm-message="" />
 *    confirm-message = Message to be displayed when element clicked.
 *
 * @author s-kudo@grooovyware.jp(Syuji Kudo)
 */
'use strict';

angular.module('confirm.click', []);
angular.module('confirm.click')
  .directive('confirmClick', ['$window', function ($window) {
    return {
      priority: -1,
      restrict: 'A',
      scope: {
        ngClick: '&'
      },
      link: function (scope, element, attr) {
        var msg = attr.confirmMessage;
        element.on('click', function (e) {
          if ( msg && !$window.confirm(msg, scope.ngClick)) {
            // cancel a default event
            e.stopImmediatePropagation();
            e.preventDefault();
          }
        });
      }
    };
  }]);
