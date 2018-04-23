require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      node = @map[key]
      update_node!(node)
      node.val
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    val = @prc.call(key)
    new_node = @store.append(key, val)
    @map[key] = new_node

    eject! if count > @max
    val
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list

    # remove node from current index
    node.prev.next = node.next
    node.next.prev = node.prev

    # set node at the end of the list
    node.prev = @store.last
    node.next = @store.last.next
    @store.last.next = node
  end

  def eject!
    to_eject = @store.first
    to_eject.prev.next = to_eject.next
    to_eject.next.prev = to_eject.prev
    @map.delete(to_eject.key)
    nil
  end
end
