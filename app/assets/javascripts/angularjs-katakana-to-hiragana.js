/**
 * @fileoverview This module is convert.katakanaToHiragana.
 * It converts the entered characters from Katakana to Hiragana.
 *
 * example:
 *  <js>
 *  angular.module('{your_module}', ['convert.katakanaToHiragana']);
 *
 *  <html>
 *  <input type="text" katakana-to-hiragana />
 *
 * @author s-kudo@grooovyware.jp(Syuji Kudo)
 */
'use strict';

angular.module('convert.katakanaToHiragana', []);

angular.module('convert.katakanaToHiragana')
  .directive('katakanaToHiragana', function () {
    return {
      priority: 1,
      restrict: 'A',
      link: function (scope, element, attr) {

        function katakanaToHiragana (str) {
          return str.replace(/[\u30a1-\u30f6]/g, function(match) {
            return String.fromCharCode(match.charCodeAt(0) - 0x60);
          });
        }

        element.on('blur', function (e) {
          element.val(katakanaToHiragana(element.val()));
        });
      }
    };
  });
