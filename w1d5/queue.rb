class Queue
  attr_accessor :array

  def initialize
    @array = []
  end

  def enqueue(el)
    array.unshift(el)
    el
  end

  def dequeue
    array.pop
  end

  def peek
    array.last
  end
end
