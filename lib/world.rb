require 'pry'

class World
  attr_reader :world, :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @world = Array.new(height, ".").map!{ Array.new(width, ".") }
    # @width = x
    # @height = y
    # row = []
    # @world = []
    # x.times { row << "." }
    # y.times { @world << y.times  }
  end

  def display
    puts @world.map {|row| row.join(" ")}.join("\n")
  end

  def toggle(x, y)
    if @world[y][x] == "."
      @world[y][x] = "@"
    else
      @world[y][x] = "."
    end
  end
end
