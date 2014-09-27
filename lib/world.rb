require 'pry'
require_relative 'rules'

class World
  attr_reader :world, :rules, :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @world = Array.new(height, ".").map!{ Array.new(width, ".") }
    @rules = Rules.new(@world)
  end

  def step
    # call all rules
    @rules.dummy_rule(@world)
    # @rules.first_rule(@world)
    # @rules.second_rule(@world)
    # @rules.third_rule(@world)
    # @rules.fourth_rule(@world)
    # apply result of all rules to be the new world
    @world = @rules.next_world
    @rules = Rules.new(@world)
  end

end
