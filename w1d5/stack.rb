class Stack
  attr_accessor :array

  def initialize
    @array = []
  end

  def push(el)
    #add element to the Stack
    array.push(el)
  end

  def pop
    #remove element from stack
    array.pop
  end

  def peek
    #show but dont remove last element in stack
    array.last
  end



end
