# [[1, 2, 3], [4, 9, 12], [3, 10, 11]]
# [1, 2, 3, 5, 9, 10, 11, 12]

def five_hundred_files(arr_of_arrs)
  prc = Proc.new { |el1, el2| el1[0] <=> el2[0] }
  heap = BinaryMinHeap.new(&prc)
  result = []

  # populate with first elements
  arr_of_arrs.length.times do |i|
    heap.push([arr_of_arrs[i][0], i, 0])
  end

  # Extract the minimum element and use the meta-data to select the
  # next element 
  while heap.count > 0
    min = heap.extract
    result << min[0]

    next_arr_i = min[1]
    next_idx = min[2] + 1
    next_el = arr_of_arrs[next_arr_i][next_idx]

    heap.push([next_el, next_arr_i, next_indx]) if next_el
  end
  result
end
