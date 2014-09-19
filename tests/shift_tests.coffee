assert = require 'assert'
Base64 = require '../base64'

describe 'shift_tests', () ->
  describe 'test right_shift', () ->
    it 'should divide a power of 2 correctly', () ->
      num64 = Base64.toBase64(64)
      expected = Base64.toBase64(32)
      shifted = Base64.right_shift(num64)

      assert.equal shifted, expected

    it 'should return 0 when shifting 0', () ->
      num0 = Base64.toBase64(0)
      expected = Base64.toBase64(0)
      shifted = Base64.right_shift(num0)

      assert.equal shifted, expected

    it 'should divide big numbers correctly', () ->
      number = 1234567890
      base64Number = Base64.toBase64(number)
      expected = Base64.toBase64(number >> 1)
      shifted = Base64.right_shift(base64Number)

      assert.equal shifted, expected

  describe 'test left_shift', () ->
    it 'should multiply a power of 2 correctly', () ->
      num32 = Base64.toBase64(32)
      expected = Base64.toBase64(64)
      shifted = Base64.left_shift(num32)

      assert.equal shifted, expected

    it 'should return 0 when shifting 0', () ->
      num0 = Base64.toBase64(0)
      expected = Base64.toBase64(0)
      shifted = Base64.left_shift(num0)

      assert.equal shifted, expected

    it 'should multiply big numbers correctly', () ->
      number = 123456789
      base64Number = Base64.toBase64(number)
      expected = Base64.toBase64(number << 1)
      shifted = Base64.left_shift(base64Number)

      assert.equal shifted, expected
