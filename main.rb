# frozen_string_literal: true

require_relative 'board'

board = Board.new
board.display_vertices
board.display_edges
board.knight_moves('f7', 'b1') # => f7 --> d6 --> b5 --> a3 --> b1
board.knight_moves('a1', 'h8') # => a1 --> c2 --> b4 --> c6 --> e5 --> g6 --> h8
board.knight_moves('d1', 'd8') # => d1 --> f2 --> h3 --> g5 --> f7 --> d8
board.knight_moves('c1', 'f7') # => c1 --> d3 --> e5 --> f7
board.knight_moves('c1', 'd3') # => c1 --> d3
