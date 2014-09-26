require 'pry'
require_relative 'rules'

class World
  attr_reader :world, :rules, :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @rules = Rules.new
    @world = Array.new(height, ".").map!{ Array.new(width, ".") }
  end

  def step
    # apply all rules
    @world = @rules.dummy_rule(@world)
    # second_rule
    @world
  end

end
