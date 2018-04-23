*Heap*
**Class Methods**
- ::child_indices()
```ruby
  def self.child_indices(len, parent_index)
    [2 * parent_index + 1, 2 * parent_index + 2].select do |idx|
      idx < len
    end
  end
```

- ::parent_indeces
```ruby
def self.parent_index(child_index)
  raise 'root has no parent' if child_index === 0
  (child_index - 1) / 2
end
```

- ::heapify_up
Relevant when inserting new elements into the heap

- ::heapify_down
Relevant when extracting

**Instance Methods**
- #initialize
- #count
- #extract

*Heapsort (With MinHeap)*

*k Largest Element*
```ruby
def k_largest_elements(array, k)
  result = BinaryMinHeap.new
  k.times do
    result.push(array.pop)
  end

  until array.empty?
    result.push(array.pop)
    result.extract
  end
  result.store 
```
