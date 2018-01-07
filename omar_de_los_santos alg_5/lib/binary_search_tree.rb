require_relative 'bst_node'

# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

class BinarySearchTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = BSTNode.new(value)
      return
    end

    self.class.insert(value, @root)
  end

  def find(value, tree_node = @root)
    # base case: the node does not exist in the tree
    return nil if tree_node.nil?

    if value == tree_node.value
      return tree_node
    elsif value < tree_node.value
      find(value, tree_node.left)
    else
      find(value, tree_node.right)
    end
  end

  def delete(value)
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
  end


  private
  # optional helper methods go here:
  def self.insert(value, node)
    # base case: left/right node, respectively, is empty
    return BSTNode.new(value) if node.nil?

    if value < node.value
      node.left = BinarySearchTree.insert(value, node.left)
    else
      node.right = BinarySearchTree.insert(value, node.right)
    end

    node
  end
end
