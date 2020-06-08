# frozen_string_literal: true

# Class that models a knight's behavior
class Knight
  def self.moves(arr)
    column = arr[0]
    row = arr[1]
    moves = []
    (-2..2).each do |i|
      next if i.zero?

      j = i.abs == 2 ? 1 : 2
      moves << [column + i, row - j]
      moves << [column + i, row + j]
    end
    moves
  end
end
