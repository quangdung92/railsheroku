/**
 * @fileoverview This module is validation.optionCheck.
 * To check the options of selectbox.
 * I will set a error message if options is nothing.
 *
 * example:
 *  <js>
 *  angular.module('{your_module}', ['validation.optionCheck']);
 *
 *  <html>
 *  <select option-check target="" trigger="" data-error-message="" />
 *    target = Check target
 *    trigger = Trigger functon
 *    data-error-message = Error message
 *
 * @author s-kudo@grooovyware.jp(Syuji Kudo)
 */
'use strict';

angular.module('validation.optionCheck', []);
angular.module('validation.optionCheck').directive('optionCheck', optionCheck);

function optionCheck () {
  return {
    restrict: 'A',
    scope: {
      target: "=",
      trigger: "@"
    },
    link: function (scope, element, attrs) {
      scope.$on(scope.trigger, function () {
        if (scope.target.length == 0) {
          element[0].setCustomValidity(attrs.errorMessage);
        } else {
          element[0].setCustomValidity('');
        }
      });
    }
  };
}
