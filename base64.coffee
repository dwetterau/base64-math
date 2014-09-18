constants = require './constants'

module.exports =
  toNumber: (base_64) ->
    num = 0
    for i in [0..base_64.length]
      num <<= 6
      num |= constants.base_to_num_map[base_64.charAt(i)]
    return num

  toBase64: (num) ->
    base_64 = ''
    while num > 0
      base_64 += constants.num_to_base_map[num & 63]
      num >> 6
    return base_64

  # Adds two base 64 number strings and returns the answer in base 64
  add: (num1, num2) ->
    # TODO: Do this the linear way.
    val1 = @toNumber num1
    val2 = @toNumber num2
    val = val1 + val2
    return @toBase64 val

  # Subtracts two base 64 number strings and returns the answer in base 64
  subtract: (num1, num2) ->
    # TODO: Do this the linear way.
    val1 = @toNumber num1
    val2 = @toNumber num2
    val = val1 - val2
    return @toBase64(val)

  # Bitshifts a base 64 number left by 1 (divide by 2)
  left_shift: (num) ->
    has_carry = false
    base64 = ''
    for i in [num.length - 1...0]
      val = constants.left_shift_map[num.charAt(i)]
      if has_carry
        base64 = val.carry_val + base64
      else
        base64 = val.val + base64
      has_carry = val.makes_carry
    return base64

  # Bitshifts a base 64 number right by 1 (multiply by 2)
  right_shift: (num) ->
    has_carry  = false
    base64 = ''
    for i in [0..num.length]
      val = constants.right_shift_map[num.charAt(i)]
      if has_carry
        base64 += val.carry_val
      else
        base64 += val.val
      has_carry = val.makes_carry
    return base64
