# frozen_string_literal: true

require_relative 'vertex'
require 'pry'

# Graph with modified breadth-first search to display path to target vertex
class Graph
  # attr_accessor :adj_list

  def initialize
    @vertex_list = []
    @adj_list = {}
    @queue = []
  end

  def add_vertex(coordinates)
    index = Vertex.to_index(coordinates)
    return false if @vertex_list[index]

    vertex = Vertex.new(coordinates)
    @vertex_list[index] = vertex
    @adj_list[vertex] = []
  end

  def add_edge(start, finish)
    # binding.pry
    start_vertex = @vertex_list[Vertex.to_index(start)]
    finish_vertex = @vertex_list[Vertex.to_index(finish)]
    return false if @adj_list[start_vertex].include? finish_vertex

    @adj_list[start_vertex] << finish_vertex
    @adj_list[finish_vertex] << start_vertex
  end

  def visited(coordinates)
    index = Vertex.to_index(coordinates)
    @vertex_list[index].found_edges = true
  end

  def visited?(coordinates)
    index = Vertex.to_index(coordinates)
    return false unless @vertex_list[index]

    @vertex_list[index].found_edges
  end

  # breadth-first search that keeps track of paths and returns once target vertex is found
  def bfs(start, target)
    target = @vertex_list[Vertex.to_index(target)]
    current = @vertex_list[Vertex.to_index(start)]
    current.was_visited = true
    @queue << [current]
    until @queue.empty?
      current_path = @queue.shift
      current = current_path.last
      @adj_list[current].each do |vertex|
        next if vertex.was_visited
        temp_path = current_path.clone
        temp_path << vertex
        return temp_path if vertex == target

        @queue << temp_path
        vertex.was_visited = true
      end
    end
    "No path found."
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
    @vertex_list.each { |vertex| print "#{vertex.to_s}, " }
    puts "(#{@vertex_list.length} vertices)"
  end
end
