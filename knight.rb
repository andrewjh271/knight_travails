class Knight
  def self.moves(row, column)
    [[row - 2, column + 1], [row - 1, column + 2],
     [row + 1, column + 2], [row + 2, column + 1],
     [row + 2, column - 1], [row + 1, column - 2],
     [row - 1, column - 2], [row - 2, column - 1]]
  end

end