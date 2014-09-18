# The lookup map
num_to_base_map =
  0: 'A', 1: 'B', 2: 'C', 3: 'D', 4: 'E', 5: 'F', 6: 'G', 7: 'H', 8: 'I', 9: 'J', 10: 'K'
  11: 'L', 12: 'M', 13: 'N', 14: 'O', 15: 'P', 16: 'Q', 17: 'R', 18: 'S', 19: 'T', 20: 'U'
  21: 'V', 22: 'W', 23: 'X', 24: 'Y', 25: 'Z', 26: 'a', 27: 'b', 28: 'c', 29: 'd', 30: 'e'
  31: 'f', 32: 'g', 33: 'h', 34: 'i', 35: 'j', 36: 'k', 37: 'l', 38: 'm', 39: 'n', 40: 'o'
  41: 'p', 42: 'q', 43: 'r', 44: 's', 45: 't', 46: 'u', 47: 'v', 48: 'w', 49: 'x', 50: 'y'
  51: 'z', 52: '0', 53: '1', 54: '2', 55: '3', 56: '4', 57: '5', 58: '6', 59: '7', 60: '8'
  61: '9', 62: '+', 63: '/'

module.exports =
  num_to_base_map: num_to_base_map

  base_to_num_map: (() ->
    map = {}
    for num, base_64 of num_to_base_map
      map[base_64] = num
    return map
  )()

  # A lookup map to use when shifting a base64 string to the right
  right_shift_map: (() ->
    right_map = {}
    for i in [0..63]
      right_map[num_to_base_map[i]] =
        val: num_to_base_map[i >> 1]
        carry_val: num_to_base_map[(i >> 1) | (1 << 5)]
        makes_carry: Boolean(i & 1)
    return right_map
  )()

  # A lookup map to use when shifting a base64 string to the left
  left_shift_map: (() ->
    left_map = {}
    for i in [0..63]
      left_map[num_to_base_map[i]] =
        val: num_to_base_map[i << 1]
        carry_val: num_to_base_map[(i << 1) | 1]
        makes_carry: Boolean(i & (1 << 5))
    return left_map
  )()
