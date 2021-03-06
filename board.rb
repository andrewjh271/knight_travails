# frozen_string_literal: true

require_relative 'graph'
require_relative 'knight'

# chess board
class Board
  MAX = 7

  def initialize
    @graph = Graph.new
    @graph.add_vertex([0, 0])
    add_knight
  end

  def knight_moves(start, target)
    start = convert_from_chess(start)
    target = convert_from_chess(target)
    path = @graph.bfs(start, target)
    display_path(path)
  end

  def display_edges
    @graph.display_adj_list
  end

  def display_vertices
    @graph.display_vertex_list
  end

  private

  def valid_moves(moves)
    moves.select { |move| move[0].between?(0, MAX) && move[1].between?(0, MAX) }
  end

  def display_path(path)
    s = path.length > 2 ? 's' : ''
    puts "You made it in #{path.length - 1} move#{s}! Here is your path:"
    path.each do |square|
      print square
      print ' --> ' unless square == path.last
    end
    puts
  end

  def add_knight(square = [0, 0])
    return if @graph.explored?(square)

    @graph.explored(square)
    moves = valid_moves(Knight.moves(square))
    moves.each do |move|
      @graph.add_vertex(move)
      @graph.add_edge(square, move)
      add_knight(move)
    end
  end

  def convert_from_chess(notation)
    [notation[0].ord - 97, MAX + 1 - notation[1].to_i]
  end

  def convert_to_chess(coordinates)
    (coordinates[0] + 97).chr + (MAX + 1 - coordinates[1]).to_s
  end
end
