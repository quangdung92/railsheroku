/**
 * @fileoverview This module is compareTo.
 * It will compare element and target.
 * If the mismatch is occurred then a error message will be shown.
 *
 * example:
 *  <js>
 *  angular.module('{your_module}', ['validation.compareTo']);
 *
 *  <html>
 *  <input type="password" compareTo="" data-error-message="" />
 *    compareTo = Target model of compare
 *    data-error-message = Error message.
 *
 * @author s-kudo@grooovyware.jp(Syuji Kudo)
 */
'use strict';

angular.module('validation.compareTo', []);
angular.module('validation.compareTo').directive('compareTo', compareTo);

function compareTo() {
  return {
    require: "ngModel",
    restrict: "A",
    scope: {
      otherModelValue: "=compareTo"
    },
    link: function (scope, element, attr, ngModel) {

      ngModel.$validators.compareTo = function (modelValue) {

        if ( modelValue == scope.otherModelValue ) {
          element[0].setCustomValidity('');
        } else {
          element[0].setCustomValidity(attr.errorMessage);
        }

      };

      scope.$watch("otherModelValue", function () {
        ngModel.$validate(); 
      });

    }
  };
}
