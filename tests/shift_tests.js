// Generated by CoffeeScript 1.8.0
(function() {
  var Base64, assert;

  assert = require('assert');

  Base64 = require('../base64');

  describe('shift_tests', function() {
    describe('test right_shift', function() {
      it('should divide a power of 2 correctly', function() {
        var expected, num64, shifted;
        num64 = Base64.toBase64(64);
        expected = Base64.toBase64(32);
        shifted = Base64.right_shift(num64);
        return assert.equal(shifted, expected);
      });
      it('should return 0 when shifting 0', function() {
        var expected, num0, shifted;
        num0 = Base64.toBase64(0);
        expected = Base64.toBase64(0);
        shifted = Base64.right_shift(num0);
        return assert.equal(shifted, expected);
      });
      return it('should divide big numbers correctly', function() {
        var base64Number, expected, number, shifted;
        number = 1234567890;
        base64Number = Base64.toBase64(number);
        expected = Base64.toBase64(number >> 1);
        shifted = Base64.right_shift(base64Number);
        return assert.equal(shifted, expected);
      });
    });
    return describe('test left_shift', function() {
      it('should multiply a power of 2 correctly', function() {
        var expected, num32, shifted;
        num32 = Base64.toBase64(32);
        expected = Base64.toBase64(64);
        shifted = Base64.left_shift(num32);
        return assert.equal(shifted, expected);
      });
      it('should return 0 when shifting 0', function() {
        var expected, num0, shifted;
        num0 = Base64.toBase64(0);
        expected = Base64.toBase64(0);
        shifted = Base64.left_shift(num0);
        return assert.equal(shifted, expected);
      });
      return it('should multiply big numbers correctly', function() {
        var base64Number, expected, number, shifted;
        number = 123456789;
        base64Number = Base64.toBase64(number);
        expected = Base64.toBase64(number << 1);
        shifted = Base64.left_shift(base64Number);
        return assert.equal(shifted, expected);
      });
    });
  });

}).call(this);