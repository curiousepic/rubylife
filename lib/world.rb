require 'pry'
require_relative 'rules'

class World
  attr_reader :world, :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @world = Array.new(height, ".").map!{ Array.new(width, ".") }
    ## old method that had interesting problem:
    # @width = x
    # @height = y
    # row = []
    # @world = []
    # x.times { row << "." }
    # y.times { @world << y.times }
  end

  def step
    # apply all rules
    dummy_rule
    # second_rule

    # return new world state
    @world
  end

  def toggle(x, y)
    if @world[y][x] == "."
      @world[y][x] = "@"
    else
      @world[y][x] = "."
    end
  end

  def dummy_rule
    toggle(1,1)
  end

end
