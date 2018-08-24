class Map

  attr_reader :map

  def initialize
    @map = []
  end

  def set(key, val)
    index = @map.find_index {|pair| pair[0] == key}
    index.nil? ? @map << [key,val] : @map[index] = [key, value]
  end

  def get(key)
    @map.each {|pair| return pair[1] if pair[0] == key}
    nil
  end

  def delete(key)
    index = @map.find_index {|pair| pair[0] == key}
    @map.delete_at(index)[1]
  end

  def show
    deep_dup(@map)
  end

  private

  attr_reader :map

  def deep_dup(arr)
    arr.map {|el| el.is_a?(Array) ? deep_dup(el) : el.dup}
  end
end
