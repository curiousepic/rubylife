require_relative "world"

class Rubylife
  attr_accessor :earth
  def run
    @earth = World.new(8,6)
    display(@earth.world)
  end

  def display(world)
    puts world.map {|row| row.join(" ")}.join("\n")
  end

end
#
# game = Rubylife.new
# game.run
