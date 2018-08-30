class Array
#array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
#find and eat longest fish

#Quadratic = bubble_sort
  def bubble_sort(array)
    i = 0
    while i < array.length-1
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        i = 0
      else
        i += 1
      end
    end
  end

  def sluggish_octo(array)
    bubble_sort(array).last
  end

  #  Log Linear Time = quick_sort
  def quick_sort(array)
    pivot = array.first

    left = array[1..-1].select {|el| el < pivot}
    right = array[1..-1].select {|el| el >= pivot}

  dominant_octo(left) + [pivot] + dominant_octo(right)
  end

  def dominant_octo(array)
    quick_sort(array).last
  end

  #linear = just iterate over
  def clever_octo(array)
    biggest = array.first
    array[1..-1].each do |fish|
      fish.length > biggest.length ? biggest = fish : next
    end
    biggest
  end


end
