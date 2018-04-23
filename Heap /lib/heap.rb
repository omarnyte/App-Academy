class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @prc = prc || Proc.new { |i, j| i <=> j }
  end

  def count
    @store.length
  end

  def extract
    val = store[0]

    if count > 1
      store[0] = store.pop
      self.class.heapify_down(store, 0, &prc)
    else
      store.pop
    end

    val
  end

  def peek
    @store[0]
  end

  def push(val)
    @store << val
    self.class.heapify_up(@store, count - 1, &prc)
  end

  public
  def self.child_indices(len, parent_index)
    i = parent_index
    [(2 * i + 1), (2 * i) + 2].select { |ind| ind < len }
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0

    ((child_index - 1) / 2)
  end


  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc ||= Proc.new { |i, j| i <=> j }

    child_idxs = child_indices(len, parent_idx)
    l_child_idx = child_idxs[0]
    r_child_idx = child_idxs[1]

    parent_val = array[parent_idx]

    children = []
    children << array[l_child_idx] if l_child_idx
    children << array[r_child_idx] if r_child_idx

    # base case: both children are either smaller or larger than the
    # parent, depending on the prc
    if children.all? { |child| prc.call(parent_val, child) <= 0 }
      return array
    end

    swap_idx = 0
    if children.length == 1
      swap_idx = l_child_idx
    else
      # parent always swaps with the smallest child
      if prc.call(children[0], children[1]) == -1
        swap_idx = l_child_idx
      else
        swap_idx = r_child_idx
      end
    end

    # recursive call
    array[parent_idx], array[swap_idx] = array[swap_idx], parent_val
    heapify_down(array, swap_idx, len, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc ||= Proc.new { |i, j| i <=> j }

    return array if child_idx == 0

    parent_idx = parent_index(child_idx)
    child_val, parent_val = array[child_idx], array[parent_idx]

    # base case: the child is larger than the parent
    return array if prc.call(child_val, parent_val) >= 0

    array[child_idx], array[parent_idx] = parent_val, child_val
    heapify_up(array, parent_idx, len, &prc) # recursive call
  end
end
