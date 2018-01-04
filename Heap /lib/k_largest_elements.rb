require_relative 'heap'

def k_largest_elements(array, k)
  prc = Proc.new { |j, i| i <=> j }

  array.length.times do |i|
    BinaryMinHeap.heapify_up(array, i, array.length, &prc)
    # p "heap up"
    # p array
  end

  results = []
  k.times do |i|
    array[0], array[-1] = array[-1], array[0]
    results.push(array.pop)
    BinaryMinHeap.heapify_down(array, 0, array.length, &prc)
    # p 'heap down'
    # p array
  end

  results
end
