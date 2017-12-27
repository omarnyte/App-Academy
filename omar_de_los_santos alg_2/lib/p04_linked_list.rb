class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end


class LinkedList
  include Enumerable

  def initialize
    @first = Node.new
    @last = Node.new
    @first.next = @last
    @last.prev = @first
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
     empty? ? nil : @first.next
   end

   def last
     empty? ? nil : @last.prev
   end

   def empty?
     @first.next == @last
   end

   def get(key)
     each { |node| return node.val if node.key == key }
     nil
   end

   def include?(key)
     any? { |node| node.key == key }
   end

   def append(key, val)
     each { |node| return node.val = val if node.key == key }

     new_node = Node.new(key, val)

     @last.prev.next = new_node
     new_node.prev = @last.prev
     new_node.next = @last
     @last.prev = new_node

     new_node
   end

  def update(key, val)
    each do |node|
      if node.key == key
        return node.val = val
      end
    end

    # in case node doesn't exist
    nil
  end

  def remove(key)
    each do |node|
      if node.key == key
        node.prev.next = node.next
        node.next.prev = node.prev
        node.next, node.prev = nil, nil
        return node.val
      end
    end

    # in case node doesn't exist
    nil
  end

  def each
   current_node = @first.next
   until current_node == @last
     yield current_node
     current_node = current_node.next
   end
  end

 def to_s
   # uncomment when you have `each` working and `Enumerable` included
   # def to_s
   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
 end
end
