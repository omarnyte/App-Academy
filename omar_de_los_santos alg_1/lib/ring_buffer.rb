require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = StaticArray.new(8)
    @capacity = 8
    @length = 0
    @start_idx = 0
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length

    @store[(index + start_idx) % capacity]
  end

  # O(1)
  def []=(index, val)
    raise 'index out of bounds' if index >= @length

    @store[(index + start_idx) % capacity] = val
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length <= 0

    popped = @store[length - 1]
    @store[length - 1 ] = nil

    # prevents the length of the array from becoming negative
    if (@length - 1) <= 0
      @length = 0
    else
      @length -= 1
    end

    popped
  end

  # O(1) ammortized
  def push(val)
    resize! if length >= capacity

    @store[@length] = val
    @length += 1
  end

  # O(1) ammortized
  def unshift(val)
    resize! if length >= capacity

    @start_idx = (@start_idx - 1) % @capacity
    @length += 1
    self[0] = val
  end

  # O(1)
  def shift
    raise 'index out of bounds' if length <= 0

    shifted = self[0]
    self[0] = nil
    @start_idx = (@start_idx + 1) % @capacity
    @length -= 1

    shifted
  end


  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    new_cap = @capacity * 2
    temp_store = StaticArray.new(new_cap)

    @length.times do |i|
      temp_store[i] = self[i]
    end

    @store = temp_store
    @capacity = new_cap
    @start_idx = 0
  end
end
