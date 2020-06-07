# frozen_string_literals: true

require_relative 'graph'
require_relative 'knight'

# chess board
class Board
  attr_accessor :graph

  MAX = 7

  def initialize
    @graph = Graph.new
  end

  def add_knight(square)
    @graph.add_vertex(square)
    return if @graph.visited?(square)
    @graph.visited(square)

    moves = Knight.moves(square)
    moves.reject! { |move| move[0] < 0 || move[0] > MAX ||
                           move[1] < 0 || move[1] > MAX }
    
    moves.each do |move|
      @graph.add_vertex(move)
      @graph.add_edge(square, move)
      add_knight(move)
    end
  end

end


board = Board.new
board.add_knight([0, 1])

board.graph.display_adj_list
board.graph.display_vertex_list
puts
path = board.graph.bfs([5,1], [1, 7])
path.each { |square| print "#{square.to_s}, "}
puts








# graph = Graph.new()

  # graph.add_vertex([0, 0])
  # graph.add_vertex([1, 2])
  # graph.add_vertex([2, 0])

  # graph.add_edge([0, 0], [1, 2])
  # graph.add_edge([1, 2], [2, 0])

  # path = graph.bfs([0,0], [2, 0])
  # path.each { |square| print "#{square.to_s}, "}
  # puts
  # graph.display_adj_list
  # graph.display_vertex_list