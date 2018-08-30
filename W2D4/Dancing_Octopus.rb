class Array

#slow dance - linear - iterate
tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

  def slow_face(move, tiles_array)
    tiles_array.each_with_index { |el, idx| return idx if el == move }
  end

  tiles_hash = {'up' => 0, 'right-up' => 1, 'right' => 2, 'right-down' => 3,
    'down' => 4, 'left-down' => 5, 'left' => 6, 'left-up' => 7}

  def constant_dance(move, tiles_hash)
    tiles_hash[move]
  end
  

end
