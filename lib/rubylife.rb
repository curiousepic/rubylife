require_relative "world"

class Rubylife
  attr_accessor :earth
  def make_world
    @earth = World.new(8,6)
    run(@earth)
  end

  def run(world)
    display(@earth.world)
    puts "Hit Enter for next step, or Q to quit"
    input = gets.chomp
    if input == ""
      self.run(@earth.step)
    elsif input.downcase = "q"
      exit
    else
      exit
    end
  end

  def display(world)
    puts world.map {|row| row.join(" ")}.join("\n")
  end



end
#
# game = Rubylife.new
# game.make_world
