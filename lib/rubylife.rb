require_relative "world"

class Rubylife
  attr_accessor :earth, :gen
  def make_world
    @earth = World.new(8,6)
    @gen = 0
    run(@earth)
  end

  def run(world)
    display(@earth.world)
    puts "Generation: #{gen}"
    puts "Hit Enter for next step, N for new world, Q to quit"
    input = gets.chomp.downcase
    if input == ""
      @gen += 1
      self.run(@earth.step)
    elsif input == "n"
      make_world
    elsif input == "q"
      exit
    else
      exit
    end
  end

  def display(world)
    puts world.map {|row| row.join(" ")}.join("\n")
  end

end

# game = Rubylife.new
# game.make_world
