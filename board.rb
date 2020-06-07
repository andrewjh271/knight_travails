# frozen_string_literals: true

require_relative 'graph'
require_relative 'knight'

# chess board
class Board
  graph = Graph.new()

  graph.add_vertex([0, 0])
  graph.add_vertex([1, 2])
  graph.add_vertex([2, 0])

  graph.add_edge([0, 0], [1, 2])
  graph.add_edge([1, 2], [2, 0])

  path = graph.bfs([0,0], [2, 0])
  path.each { |square| print "#{square.to_s}, "}
  puts
  # graph.display_adj_list
  # graph.display_vertex_list

end