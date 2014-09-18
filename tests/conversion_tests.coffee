assert = require 'assert'
Base64 = require '../base64'

describe 'conversion_tests', () ->
  describe 'test toNumber', () ->
    it 'should convert a string to a number', () ->
      base64_number = 'AB'
      expected = 64
      converted = Base64.toNumber(base64_number)

      assert.equal converted, expected

  describe 'test toBase64', () ->

  describe 'test full conversion', () ->
    it 'should return the same value as the input when converted both ways', () ->
      base64_string1 = '2s'
      console.log Base64.toNumber(base64_string1)
      assert.equal base64_string1, Base64.toBase64(Base64.toNumber(base64_string1))