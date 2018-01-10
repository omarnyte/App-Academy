require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

# Kahn's Algorithm 
def topological_sort(vertices)
  queue = []
  result = []
  
  # Collect nodes with zero in-degree in a queue.
  vertices.each do |vertex|
    queue.push(vertex) if vertex.in_edges.empty?
  end

  until queue.empty?
    vertex = queue.shift
    result.push(vertex)

    vertex.out_edges.reverse.each do |edge|
      queue.push(edge.to_vertex) if edge.to_vertex.in_edges.length == 1
      edge.destroy!
    end 
  end

  # if we removed all nodes from the graph, return the list
  if vertices.length == result.length
    return result
    # else we return an empty list that indicates that an order is not possible due 
    # to a cycle
  else
    return []
  end
end
