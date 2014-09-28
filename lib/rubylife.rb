require_relative "world"

class Rubylife
  attr_accessor :earth, :gen
  def initialize
    make_world
  end

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

  def display(world)
    puts world.map {|row| row.join(" ")}.join("\n")
  end

  def get_input
    puts "(Enter) to step, (T)oggle a cell, (I)nsert formation, (N)ew world, (Q)uit"
    input = gets.chomp.downcase
    if input == ""
      step_world
    elsif input == "n"
      make_new_world
    elsif input == "t"
      toggle_cell
    elsif input == "i"
      insert_formation
    elsif input == "q"
      quit
    else
      puts "Invalid input"
      run(@earth)
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

  def insert_formation
    puts "Give the top-left cell:"
    puts "Column?"
    c = input = (gets.to_i - 1)
    puts "Row?"
    r = (gets.to_i - 1)
    puts "Choose formation: (G)lider, (S)paceship"
    input = gets.chomp.downcase
    if input == "g"
      create_glider(r,c)
      run(@earth)
    elsif input == "s"
      create_spaceship(r,c)
      run(@earth)
    else
      puts "Invalid input"
      run(@earth)
    end
  end

  def create_glider(r,c)
    @earth.toggle(r,c+1)
    @earth.toggle(r+1,c+2)
    @earth.toggle(r+2,c)
    @earth.toggle(r+2,c+1)
    @earth.toggle(r+2,c+2)
  end

  def create_spaceship(r,c)
    @earth.toggle(r,c)
    @earth.toggle(r+2,c)
    @earth.toggle(r+3,c+1)
    @earth.toggle(r+3,c+2)
    @earth.toggle(r,c+3)
    @earth.toggle(r+3,c+3)
    @earth.toggle(r+3,c+4)
    @earth.toggle(r+2,c+4)
    @earth.toggle(r+1,c+4)
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


end

game = Rubylife.new
game.run
