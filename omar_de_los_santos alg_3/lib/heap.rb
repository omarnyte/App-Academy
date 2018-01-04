class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = Array.new
    @prc = prc || Proc.new { |i, j| i <=> j }
  end

  def count
  end

  def extract
  end

  def peek
    @store[0]
  end

  def push(val)
    @store.push(val)
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
      # parent, depenidng on the prc
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

  end
end
