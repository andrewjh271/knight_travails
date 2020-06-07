# frozen_string_literals: true

require_relative 'vertex'
require 'pry'

class Graph
  # attr_accessor :adj_list

  def initialize
    @vertex_list = []
    @adj_list = {}
    @queue = []
  end

  def add_vertex(coordinates)
    vertex = Vertex.new(coordinates)
    @vertex_list[Vertex.to_index(coordinates)] = vertex
    @adj_list[vertex] = []
  end

  def add_edge(start, finish)
    start_vertex = @vertex_list[Vertex.to_index(start)]
    finish_vertex = @vertex_list[Vertex.to_index(finish)]
    @adj_list[start_vertex] << finish_vertex
    @adj_list[finish_vertex] << start_vertex
    
  end

  def bfs(start, target)
    target = @vertex_list[Vertex.to_index(target)]
    current = @vertex_list[Vertex.to_index(start)]
    current.was_visited = true
    @queue << [current]
    until @queue.empty?
      current_path = @queue.shift
      current = current_path.last
      @adj_list[current].each do |vertex|
        # binding.pry
        next if vertex.was_visited
        temp_path = current_path.clone
        temp_path << vertex
        return temp_path if vertex == target

        @queue << temp_path
        vertex.was_visited = true
      end
    end
    return "No path found."
  end

  def display_adj_list
    @adj_list.each do |k, v|
      print "#{k.to_s} => "
      v.each { |vertex| print "#{vertex.to_s}, " }
      puts
    end
  end

  def display_vertex_list
    print "Vertex list: "
    @vertex_list.each { |vertex| print "#{vertex.to_s}, "}
    puts
  end
end