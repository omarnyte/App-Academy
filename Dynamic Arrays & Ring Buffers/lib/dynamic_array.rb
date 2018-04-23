require_relative "static_array"

class DynamicArray
  attr_reader :length
  def initialize
    @store = StaticArray.new(8)
    @capacity =  8
    @length = 0
  end

  def length
    @length
  end

  # O(1)
  def [](index)
    raise 'index out of bounds' if index >= @length
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    raise 'index out of bounds' if @length <= 0

    popped = @store[length - 1]
    @store[length - 1] = nil

    # prevents the length of the array from becoming negative
    if (@length - 1) <= 0
      @length = 0
    else
      @length -= 1
    end

    popped
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @length >= @capacity 

    @store[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    raise 'index out of bounds' if @length <= 0

    shifted = @store[0]
    temp_arr = StaticArray.new(capacity)
    (1...@length).each do |i| #skips the shifted element
      temp_arr[i - 1] = @store[i]
    end

    @store = temp_arr

    # prevents the length of the array from becoming negative
    if (@length - 1) <= 0
      @length = 0
    else
      @length -= 1
    end

    shifted
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    # resize! if length + 1 > capacity

    temp_arr = StaticArray.new(capacity)
    temp_arr[0] = val
    (0...length).each do |i|
      temp_arr[i + 1] = @store[i]
    end

    @store = temp_arr

    @length += 1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)

  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    temp_arr = StaticArray.new(capacity * 2)

    @length.times do |i|
      temp_arr[i] = @store[i]
    end

    @store = temp_arr
    @capacity *= 2
  end
end
