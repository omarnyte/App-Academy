# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  attr_reader :stat_arr
  def initialize(length)
    self.store = Array.new(length)
  end

  # O(1)
  def [](index)
    self.store[index]
  end

  # O(1)
  def []=(index, value)
    self.store[index] = value
  end

  protected
  attr_accessor :store
end
