// Generated by CoffeeScript 1.8.0
(function() {
  var Base64, assert;

  assert = require('assert');

  Base64 = require('../base64');

  describe('conversion_tests', function() {
    describe('test toNumber', function() {
      it('should convert a string to a number', function() {
        var base64_number, converted, expected;
        base64_number = 'AB';
        expected = 64;
        converted = Base64.toNumber(base64_number);
        return assert.equal(converted, expected);
      });
      return it('should convert a base64 number with leading 0s correctly', function() {
        var base64_number, converted, expected;
        base64_number = 'BAA';
        expected = 1;
        converted = Base64.toNumber(base64_number);
        return assert.equal(converted, expected);
      });
    });
    describe('test toBase64', function() {
      it('should correctly convert a number to base64', function() {
        var converted, expected, value;
        value = 64;
        expected = 'AB';
        converted = Base64.toBase64(value);
        return assert.equal(converted, expected);
      });
      return it('should convert 0 correctly', function() {
        return assert.equal(Base64.toBase64(0), 'A');
      });
    });
    return describe('test full conversion', function() {
      return it('should return the same value as the input when converted both ways', function() {
        var base64_string1;
        base64_string1 = '234s';
        return assert.equal(Base64.toBase64(Base64.toNumber(base64_string1)), base64_string1);
      });
    });
  });

}).call(this);