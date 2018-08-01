class Map
  attr_accessor :array
  def initialize
    @array = []
  end

  def set (key, value)
    included_index = array.index{|pair| pair[0] = key}
    if included_index
      array[included_index][1] = value
    else
      array.push([key, value])
    end
  end
  
  def get(key)
    array.each do |pair|
      return pair.last if pair.first == key
    end
  end

  def delete(key)
    array.reject! do |pair|
      pair.first == key
    end
  end

  def show
    array
  end
end
