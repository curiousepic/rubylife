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
    puts "World Size: #{@earth.width}x#{@earth.height}  Generation: #{gen}"
    get_input
  end

  def get_input
    puts "(Enter) to step, (T)oggle a cell, (N)ew world, (Q)uit"
    input = gets.chomp.downcase
    if input == ""
      step_world
    elsif input == "n"
      make_new_world
    elsif input == "t"
      toggle_cell
    elsif input == "q"
      quit
    else
      run(world)
    end
  end

  def step_world
    @gen += 1
    self.run(@earth.step)
  end

  def make_new_world
    puts "Custom size? Y/N"
    custom = gets.chomp.downcase
    if custom == "y"
      puts "Remember to resize the window if the world is too big."
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
  end

  def toggle_cell
    puts "Column?"
    c = (gets.to_i - 1)
    puts "Row?"
    r = (gets.to_i - 1)
    if r < 0 || c < 0 || r > @earth.height || c > @earth.width
      puts "Invalid cell"
      run(@earth)
    else
      @earth.toggle(r,c)
      run(@earth)
    end
  end

  def quit
    puts "Are you sure you want to quit? Y/N"
    confirm = gets.chomp.downcase
    if confirm == "y"
      exit
    else
      run(@earth)
    end
  end

  def display(world)
    puts world.map {|row| row.join(" ")}.join("\n")
  end

end

game = Rubylife.new
game.make_world
