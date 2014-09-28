require 'pry'
require_relative 'rules'

class World
  attr_reader :world, :rules, :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @world = Array.new(height, ".").map!{ Array.new(width, ".") }
    @rules = Rules.new(@width, @height)
  end

  def step
    @rules.conway(@world)
    @world = @rules.next_world
    @rules = Rules.new(@width, @height)
  end

  def toggle(r,c)
    if @world[r][c] == "."
      @world[r][c] = "@"
    else
      @world [r][c] = "."
    end
  end

end
