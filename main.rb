# frozen_string_literal: true

require_relative 'board'

board = Board.new
board.display_vertices
board.display_edges
board.knight_moves('f7', 'b1')
board.knight_moves('a1', 'h8')
board.knight_moves('d1', 'd8')
board.knight_moves('c1', 'f7')
