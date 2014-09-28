require_relative "world"

class Rubylife
  attr_accessor :earth, :gen
  def make_world
    @earth = World.new(40,20)
    @gen = 0
    run(@earth)
  end

  def run(world)
    display(@earth.world)
    puts "Generation: #{gen}"
    puts "(Enter) to step, (T)oggle cells, (N)ew world, (Q)uit"
    input = gets.chomp.downcase
    if input == ""
      @gen += 1
      self.run(@earth.step)
    elsif input == "n"
      puts "Custom size? Y/N"
      custom = gets.chomp.downcase
      if custom == "y"
        puts "How wide?"
        width = (gets.to_i)
        puts "How tall?"
        height = (gets.to_i)
        @earth = World.new(width,height)
        @gen = 0
        run(@earth)
      else
        make_world
      end
    elsif input == "t"
      puts "Column?"
      c = (gets.to_i - 1)
      puts "Row?"
      r = (gets.to_i - 1)
      @earth.toggle(r,c)
      run(world)
    elsif input == "q"
      puts "Are you sure you want to quit? Y/N"
      confirm = gets.chomp.downcase
      if confirm == "y"
        exit
      else
        run(world)
      end
    else
      run(world)
    end
  end

  def display(world)
    puts world.map {|row| row.join(" ")}.join("\n")
  end

end

game = Rubylife.new
game.make_world
