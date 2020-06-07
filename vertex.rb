class Vertex
  attr_accessor :coordinates, :was_visited, :found_edges

  BOARD_SIZE = 8

  def self.to_index(arr)
    arr[0] * BOARD_SIZE + arr[1]
  end
  
  def self.from_index(index)
    [index / BOARD_SIZE, index % BOARD_SIZE]
  end
  
  def initialize(coordinates)
    @coordinates = coordinates
    @was_visited = false
    @found_edges = false
  end

  def notation
    (coordinates[0] + 97).chr + coordinates[1].to_s
  end

  def to_s
    coordinates
  end

end