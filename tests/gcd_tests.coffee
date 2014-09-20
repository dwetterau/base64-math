assert = require 'assert'
Base64 = require '../base64'

describe 'gcd_tests', () ->
  describe 'test gcd', () ->
    it 'should calculate the gcd with 1 correctly', () ->
      check_with_1 = (num) ->
        base = Base64.toBase64 num
        num1 = Base64.toBase64 1
        gcd = Base64.gcd num1, base
        assert.equal gcd, num1

      check_with_1 1
      check_with_1 2
      check_with_1 1234567890

    it 'should calculate the gcd correctly', () ->
      check_gcd = (num1, num2, expected) ->
        num1 = Base64.toBase64 num1
        num2 = Base64.toBase64 num2
        expected = Base64.toBase64 expected

        gcd = Base64.gcd num1, num2
        assert.equal gcd, expected

      check_gcd 2, 2, 2
      check_gcd 1234567890, 126, 18
      check_gcd 1234, 12345, 1
      check_gcd 32, 64, 32
