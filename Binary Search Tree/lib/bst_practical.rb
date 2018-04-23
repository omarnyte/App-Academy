require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  # bst = BinarySearchTree.new
  # bst.root = tree_node
  # results = []
  #
  # until results.length == k
  #   max = bst.maximum
  #   results.push(max.value)
  #   p results
  #   bst.delete(max.value)
  #   max = bst.root if max.parent == nil
  # end
  #
  # results[-1]
  
  bst = BinarySearchTree.new
  bst.root = tree_node
  array = bst.in_order_traversal
  return bst.find(array[array.length - k])
end

# In Order Iterative 
def inorder_iter(tree_node)
  stack = []
  current = tree_node 
  until current.nil ?? stack.empty? 
    if current 
      stack << current 
      current = current.left 
    else
      top_node = stack.pop
      p top_node.value 
      curent = top_node.right 
    end 
  end 
end 