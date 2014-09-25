class World
  attr_reader :world, :width, :height

  def initialize(x, y)
    @width = x
    @height = y
    row = []
    @world = []
    x.times { row << "." }
    y.times { @world << row }
  end

  def display
    puts @world.map {|row| row.join}.join("\n")
  end
end


earth = World.new(18,6)
earth.display
