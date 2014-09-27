class Rules
  attr_reader :next_world

  def initialize(world)
    @next_world =
    Array.new(world.length, ".").map!{ Array.new(world[0].length, ".") }
  end

  def birth(x, y)
    @next_world[y][x] = "@"
  end

  def kill(x, y)
    @next_world[y][x] = "."
  end

  def count_neighbors(r,c,world)
    neighbors = 0
    # make an array of adjacent cell states
    adjacent = [
      world[r-1][c-1], world[r-1][c], world[r-1][c+1],
      world[r][c-1],                  world[r][c+1],
      world[r+1][c-1], world[r+1][c], world[r+1][c+1]
      ]
    adjacent.each do |s|
      if s == "@"
        neighbors += 1
      end
    end
    neighbors
  end

  def dummy_rule(world)
    if world[1][1] == "."
      birth(1, 1)
    else
      kill(1, 1)
    end
  end



  # All of these rules need to be applied to the current world, and
  # then changed in the next_world array
  # do I need to take world dimensions into account here?
  #
  # def first_rule(world)
  #   # 1. Any live cell with fewer than two live neighbors dies, as if
  #   #   caused by under-population.
  #   # for each cell in each subarray, if alive...
  #   # check if there are 2 or more adjacent cells alive
  #   world.each do |r|
  #     r.each do |c|
  #       if c == "@"
  #         neighbors = count_neighbors(r,c,world)
  #
  #
  #       end
  #     end
  #   end
  # end



  def second_rule(world)
    # 2. Any live cell with two or three live neighbors lives on to the
    #   next generation.
  end

  def third_rule(world)
    # 3. Any live cell with more than three live neighbors dies, as if
    #   by overcrowding.
  end

  def fourth_rule(world)
    # 4. Any dead cell with exactly three live neighbors becomes a live
    #   cell, as if by reproduction.
  end

    # adjacent cells are:
    #   subarray, index - 1
    #   subarray, index + 1
    #   subarray + 1, index - 1
    #   subarray + 1, index
    #   subarray + 1, index + 1
    #   subarray - 1, index - 1
    #   subarray - 1, index
    #   subarray - 1, index + 1

end
