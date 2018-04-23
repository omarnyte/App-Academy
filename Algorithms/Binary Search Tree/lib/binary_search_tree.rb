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
    to_delete = find(value)

    # First Case: node to be deleted has no children
    if to_delete.left.nil? && to_delete.right.nil?
      if value == @root.value
        @root = to_delete.left
        return
      else
        to_delete.parent.left = nil if value < to_delete.value
        to_delete.parent.right = nil if value >= to_delete.value
      end

    # Second Case: node to be deleted has one child
    elsif to_delete.left.nil? ^ to_delete.right.nil?
      old_parent = to_delete.parent
      if to_delete.left
        old_child = to_delete.left
      else
        old_child = to_delete.right
      end
      # determine whether child to be promoted is a left or right child
      if old_parent.value < old_child.value
        old_parent.right = old_child.right
        old_child.parent = old_parent
      else
        old_parent.left = old_child
        old_child.parent = old_parent
      end

    #Third Case: node to be deleted has both a left and a right child
    else
      replacement_node = maximum(to_delete.left)
      # if replacement node has one child
      if replacement_node.left
        old_parent = replacement_node.parent
        old_child = replacement_node.left
        old_parent.right = old_child
        old_child.parent = old_parent
        to_delete.value = replacement_node.value
      end
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    # Will be finding the maximum on the left subtree (i.e. the first
    # node to have no right child)

    # base case: node has no right child
    return tree_node if tree_node.right.nil?

    maximum(tree_node.right)
  end

  def depth(tree_node = @root)
    # base cases: BST is empty or has no children
    return 0 if tree_node.nil?
    return 0 if tree_node.left.nil? && tree_node.right.nil?

    left = 1 + depth(tree_node.left)
    right = 1 + depth(tree_node.right)

    # return only the deepest subtree
    left > right ? left : right
  end

  def is_balanced?(tree_node = @root)
    # base cases: BST is empty or has no children
    return true if tree_node.nil?
    return true if tree_node.left.nil? && tree_node.right.nil?

    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)

    if left_depth > right_depth
      return false if left_depth - right_depth > 1
    else
      return false if right_depth - left_depth > 1
    end

    return true if is_balanced?(tree_node.left) && is_balanced?(tree_node.right)
    false
  end

  def in_order_traversal(tree_node = @root, arr = [])
    if tree_node.left
      in_order_traversal(tree_node.left, arr)
    end

    arr.push(tree_node.value)

    if tree_node.right
      in_order_traversal(tree_node.right, arr)
    end

    arr
  end


  private
  # optional helper methods go here:
  def self.insert(value, node)
    # base case: left/right node, respectively, is empty
    return BSTNode.new(value) if node.nil?

    if value < node.value
      node.left = BinarySearchTree.insert(value, node.left)
      node.left.parent = node
    else
      node.right = BinarySearchTree.insert(value, node.right)
      node.right.parent = node
    end

    node
  end

  # def promote_child(tree_node = @root, node)
  #   if tree_node.left.nil? ^ to_delete.right.nil?
  #     old_parent = to_delete.parent
  #     old_child = to_delete.left || to_delete.right
  #   # determine whether child to be promoted is a left or right child
  #     if old_parent.value < old_child.value
  #       old_parent.right = old_child
  #     else
  #       old_parent.left = old_child
  #     end
  #   end
  # end

end
