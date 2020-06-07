# frozen_string_literal: true

# Class that models a knight's behavior
class Knight
  def self.moves(arr)
    row = arr[0]
    column = arr[1]
    [[row - 2, column + 1], [row - 1, column + 2],
     [row + 1, column + 2], [row + 2, column + 1],
     [row + 2, column - 1], [row + 1, column - 2],
     [row - 1, column - 2], [row - 2, column - 1]]
  end
end
