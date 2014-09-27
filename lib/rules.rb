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

  def count_neighbors(c,r,world)
    neighbors = 0
    # make an array of adjacent cell states
    # adjacent cells are:
    #   subarray, index - 1
    #   subarray, index + 1
    #   subarray + 1, index - 1
    #   subarray + 1, index
    #   subarray + 1, index + 1
    #   subarray - 1, index - 1
    #   subarray - 1, index
    #   subarray - 1, index + 1
    adjacent = Array.new(8, nil)
    # detect edges and add cells
    if world[c-1] != nil
      adjacent << world[r][c-1]
    end
    if world[c+1] != nil
      adjacent << world[r][c+1]
    end
    if world[r+1] != nil
      adjacent << world[r+1][c]
      if world[c-1] != nil
        adjacent << world[r+1][c-1]
      end
      if world[c+1] != nil
        adjacent << world[r+1][c+1]
      end
    end
    if world[r-1] != nil
      adjacent << world[r-1][c]
      if world[c-1] != nil
        adjacent << world[r-1][c-1]
      end
      if world[c+1] != nil
        adjacent << world[r-1][c+1]
      end
    end
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
  #
  # 1. Any live cell with fewer than two live neighbors dies, as if
  #   caused by under-population.
  # 2. Any live cell with two or three live neighbors lives on to the
  #   next generation.
  # 3. Any live cell with more than three live neighbors dies, as if
  #   by overcrowding.
  # 4. Any dead cell with exactly three live neighbors becomes a live
  #   cell, as if by reproduction.

end
