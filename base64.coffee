constants = require './constants'

module.exports =
  toNumber: (base_64) ->
    num = 0
    for i in [0..base_64.length].reverse()
      num <<= 6
      num |= constants.base_to_num_map[base_64.charAt(i)]
    return num

  toBase64: (num) ->
    base_64 = ''
    while num > 0
      base_64 += constants.num_to_base_map[num & 63]
      num >>= 6
    if base_64.length == 0 and num == 0
      return constants.num_to_base_map[0]

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

  # Multiplies two base 64 number strings and returns the answer in base 64
  multiply: (num1, num2) ->
    # TODO: Do this the linear way.
    val1 = @toNumber num1
    val2 = @toNumber num2
    val = val1 * val2
    return @toBase64(val)

  # Divides two base 64 number strings and returns the answer in base 64
  divide: (num1, num2) ->
    # TODO: Do this the linear way.
    val1 = @toNumber num1
    val2 = @toNumber num2
    val = val1 / val2
    return @toBase64(val)

  # Compares two base64 number strings. Returns 0 if equal, < 0 if first is smaller,
  # and > 0 if the first is larger
  compare: (num1, num2) ->
    num1 = @trim(num1)
    num2 = @trim(num2)

    # If the encodings are different lengths after trimming, the longer is always bigger
    length_diff = num1.length - num2.length
    if length_diff != 0
      return length_diff

    # Starting at most significant digit, if they differ, the one with the larger is bigger
    for i in [num1.length - 1..0]
      v1 = constants.base_to_num_map[num1.charAt(i)]
      v2 = constants.base_to_num_map[num2.charAt(i)]
      diff = v1 - v2
      if diff != 0
        return diff

    # If all digits are the same, must be equal
    return 0

  # Bitshifts a base 64 number right by 1 (divide by 2)
  right_shift: (num) ->
    has_carry = false
    base64 = ''
    for i in [num.length - 1..0]
      val = constants.right_shift_map[num.charAt(i)]
      if has_carry
        base64 = val.carry_val + base64
      else
        base64 = val.val + base64
      has_carry = val.makes_carry
    return @trim(base64)

  # Bitshifts a base 64 number left by 1 (multiply by 2)
  left_shift: (num) ->
    has_carry  = false
    base64 = ''
    for i in [0...num.length]
      val = constants.left_shift_map[num.charAt(i)]
      if has_carry
        base64 += val.carry_val
      else
        base64 += val.val
      has_carry = val.makes_carry

    # If there is still a carry at the end, we need to add on a 1
    if has_carry
      base64 += constants.num_to_base_map[1]
    return base64

  # Trims off leading 0's from a base64 representation
  trim: (num) ->
    index = num.length
    for i in [0..num.length - 1].reverse()
      if num.charAt(i) == 'A'
        index = i
      else
        break
    return num.substring 0, Math.max(index, 1)

