/**
 * @fileoverview This module is fileCheck.
 * Show alert message if file type is pdf
 * or file name is duplication.
 *
 * example:
 *  <js>
 *  angular.module('{your_module}', ['fileCheck]']);
 *
 *  <html>
 *  <input type="file" file-check data-error-message="" data-warning-message="">
 *    data-error-message = Message to be displayed when file name is duplicated.
 *    data-warning= Message to be displayed when file type is pdf.
 *
 * @author s-kudo@grooovyware.jp(Syuji Kudo)
 */
'use strict';

angular.module('fileCheck', []);
angular.module('fileCheck').directive('fileCheck', fileCheck);
fileCheck.$inject = ['$window'];

function fileCheck ($window) {

  return {
    restrict: 'A',
    link: function (scope, element, attrs) {

      // to display an alert if the file type is not a PDF.
      function checkType(file) {
        //@TrongKhoi update: this check would not work on IE
        //if (file.type != 'application/pdf') {
        if (file.name.substr(file.name.lastIndexOf('.') +1).toUpperCase() != "PDF") {
          $window.alert(attrs.warningMessage, 'warning');
        }

      }

      // to display an alert if the filename is duplication.
      function checkUniqe(file) {

        var flag = true;

        angular.element('input[type=file]').each( function (index, obj) {
          if (file !== obj.files[0]) {
            if (obj.files[0] && file.name == obj.files[0].name) {
              flag = false;
              return false;
            }
          }
        });

        if (flag == false) {
          $window.alert(attrs.errorMessage);
          element.val('');
        }

        return flag;

      }

      element.on('change', function (e) {
        element.parent().parent().parent().find('.filename').val('');
        var file = e.target.files[0];

        if (checkUniqe(file)) {
          checkType(file);
          element.parent().parent().parent().find('.filename').val(file.name);
        }

      });
    }
  };

}
