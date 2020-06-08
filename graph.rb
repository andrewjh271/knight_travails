# frozen_string_literal: true

require_relative 'vertex'
require 'pry'

# Graph with modified breadth-first search to display path to target vertex
class Graph
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
    start_vertex = @vertex_list[Vertex.to_index(start)]
    finish_vertex = @vertex_list[Vertex.to_index(finish)]
    return false if @adj_list[start_vertex].include? finish_vertex

    @adj_list[start_vertex] << finish_vertex
    @adj_list[finish_vertex] << start_vertex
  end

  def explored(coordinates)
    index = Vertex.to_index(coordinates)
    @vertex_list[index].found_edges = true
  end

  def explored?(coordinates)
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

        new_path = current_path + [vertex]
        if vertex == target
          reset
          return new_path
        end
        @queue << new_path
        vertex.was_visited = true
      end
    end
  end

  def display_adj_list
    puts 'Adjacency list:'
    @adj_list.each do |k, v|
      print "#{k} => "
      v.each do |vertex|
        print vertex.to_s
        print ', ' unless vertex == v.last
      end
      puts
    end
  end

  def display_vertex_list
    print 'Vertex list: '
    @vertex_list.each do |vertex|
      print vertex.to_s
      print ', ' unless vertex == @vertex_list.last
    end
    puts " (#{@vertex_list.length} vertices)"
  end

  private

  def reset
    @queue = []
    @vertex_list.each { |vertex| vertex.was_visited = false }
  end
end
