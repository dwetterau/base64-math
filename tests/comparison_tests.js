// Generated by CoffeeScript 1.8.0
(function() {
  var Base64, assert;

  assert = require('assert');

  Base64 = require('../base64');

  describe('comparison_tests', function() {
    return describe('test compare', function() {
      it('should say that equal numbers are equal', function() {
        var compared, expected, num0, num64, numBig;
        num0 = Base64.toBase64(0);
        num64 = Base64.toBase64(64);
        numBig = Base64.toBase64(1234567890);
        expected = 0;
        compared = Base64.compare(num0, num0);
        assert.equal(compared, expected);
        compared = Base64.compare(num64, num64);
        assert.equal(compared, expected);
        compared = Base64.compare(numBig, numBig);
        return assert.equal(compared, expected);
      });
      return it('should compare different numbers correctly', function() {
        var different_helper;
        different_helper = function(val) {
          var val_base64, val_base64_bigger;
          val_base64 = Base64.toBase64(val);
          val_base64_bigger = Base64.toBase64(val + 1);
          assert(Base64.compare(val_base64, val_base64_bigger) < 0);
          return assert(Base64.compare(val_base64_bigger, val_base64) > 0);
        };
        different_helper(0);
        different_helper(63);
        different_helper(64);
        return different_helper(1234567890);
      });
    });
  });

}).call(this);
