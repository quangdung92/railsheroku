/**
 * @fileoverview This module is set content editable content to hidden input.
 * Since the content editable can not be sent in the form,
 * We want to set the contents to hidden of input.
 *
 * example:
 *  <js>
 *    angular.module('{your_module}', ['agendacontent.tohiddeninput']);
 *
 *  <html>
 *    <div contentEditable agendacontent-to-hidden-input hideen-input-name="target hidden input name" />
 * 
 *    <input type="hidden" name="target hidden input name" />
 *
 * @author k-haramoto@grooovyware.jp(Koutarou Haramoto)
 */
'use strict';

angular.module('agendacontent.to.hiddeninput', []);
angular.module('agendacontent.to.hiddeninput').directive('agendacontentToHiddenInput', function () {
  return {
    restrict: "A",
    link: function (scope, element, attr) {
      angular.element('document').ready(function() {
        setHtmlToVal();
      });

      element.on('blur keyup change', function() {
        setHtmlToVal();
      });

      function setHtmlToVal() {
        angular.element("input[name='" + attr.hiddenInputName + "']").val(element.context.innerHTML);
      }
    }
  };
});
