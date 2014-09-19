assert = require 'assert'
Base64 = require '../base64'

describe 'conversion_tests', () ->
  describe 'test toNumber', () ->
    it 'should convert a string to a number', () ->
      base64_number = 'AB'
      expected = 64
      converted = Base64.toNumber base64_number

      assert.equal converted, expected

    it 'should convert a base64 number with leading 0s correctly', () ->
      base64_number = 'BAA'
      expected = 1
      converted = Base64.toNumber base64_number

      assert.equal converted, expected

  describe 'test toBase64', () ->
    it 'should correctly convert a number to base64', () ->
      value = 64
      expected = 'AB'
      converted = Base64.toBase64 value

      assert.equal converted, expected

    it 'should convert 0 correctly', () ->
      assert.equal Base64.toBase64(0), 'A'


  describe 'test full conversion', () ->
    it 'should return the same value as the input when converted both ways', () ->
      base64_string1 = '234s'
      assert.equal Base64.toBase64(Base64.toNumber(base64_string1)), base64_string1
