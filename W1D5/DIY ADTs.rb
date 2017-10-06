#Exercise 1 - Stack  class Stack
class Stack
    def initialize
      @stack = []
    end

    def add(el)
      @stack << el
      el
    end

    def remove
      @stack.pop
    end

    def show
      @stack.dup
    end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end
end

class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index {|pair| pair[0] == key}
    if pair_index
      @map[pair_index][1] = value
    else
      @map << [key, value]
    end

    [key, value]
  end

  def remove(key)
     @map.reject! {|pair| pair[0] == key}
     nil
   end


  def show
    @map.dup 
  end
  #  def show
  #      deep_dup(@map)
  #    end
  #
  # private
  #   def deep_dup(arr)
  #    arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
  #  end
 end
