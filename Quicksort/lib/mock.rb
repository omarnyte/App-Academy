# Write an in-place instance method on the array class that will find
# the kth smallest element in O(n) time. You will likely want to use a
# partition method similarly to if not exactly the same as that which you
# used for QuickSort! For a bonus ,how can we eliminate any extra space
# cost?

class Array
  def kth_smallest
    left = 0
    right = self.length - 1
    while true
      return self[left] if left == right
      pivot_idx = Array.partition(self, left, right-left+1)
      if k-1 == pivot_idx
        return self[k-1]
      elsif k-1 < pivot_idx
        right = pivot_idx - 1
      else
        left = pivot_idx + 1
      end
    end 
  end
end
