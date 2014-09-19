# The lookup map
num_to_base_map = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
  'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U',
  'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e',
  'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
  'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y',
  'z', '0', '1', '2', '3', '4', '5', '6', '7', '8',
  '9', '+', '/'
]

module.exports =
  num_to_base_map: num_to_base_map

  base_to_num_map: (() ->
    map = {}
    for base_64, index in num_to_base_map
      map[base_64] = index
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
        val: num_to_base_map[(i << 1) & 63]
        carry_val: num_to_base_map[((i << 1) | 1) & 63]
        makes_carry: Boolean(i & (1 << 5))
    return left_map
  )()
