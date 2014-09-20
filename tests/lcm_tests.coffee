assert = require 'assert'
Base64 = require '../base64'

describe 'lcm_tests', () ->
  describe 'test lcm', () ->
    it 'should calculate the lcm with 1 correctly', () ->
      check_with_1 = (num) ->
        base = Base64.toBase64 num
        num1 = Base64.toBase64 1
        lcm = Base64.lcm num1, base
        assert.equal lcm, base

      check_with_1 1
      check_with_1 2
      check_with_1 1234567890

    it 'should calculate the lcm correctly', () ->
      check_lcm = (num1, num2, expected) ->
        num1 = Base64.toBase64 num1
        num2 = Base64.toBase64 num2
        expected = Base64.toBase64 expected

        lcm = Base64.lcm num1, num2
        assert.equal lcm, expected

      check_lcm 2, 2, 2
      check_lcm 2350, 125, 11750
      check_lcm 1234, 12345, 15233730
      check_lcm 32, 64, 64
