class Rules
  attr_reader :next_world

  def initialize(world)
    @next_world =
    Array.new(world.length, ".").map!{ Array.new(world[0].length, ".") }
  end

  def birth(r, c)
    @next_world[r][c] = "@"
  end

  def kill(r, c)
    @next_world[r][c] = "."
  end

  def count_neighbors(r,c,world)
    neighbors = 0
    # make an array of adjacent cell states
    adjacent = Array.new(8, nil)
    # detect edges and add cells
    if c != 0
      adjacent << world[r][c-1]
    end
    if world[c+1] != nil
      adjacent << world[r][c+1]
    end
    if world[r+1] != nil
      adjacent << world[r+1][c]
      if c != 0
        adjacent << world[r+1][c-1]
      end
      if world[c+1] != nil
        adjacent << world[r+1][c+1]
      end
    end
    if r != 0
      adjacent << world[r-1][c]
      if c != 0
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

  def conway(world)
    row_index = 0
    world.each do |r_array|
      r_array.each_index do |c|
        neighbors = count_neighbors(row_index, c, world)
        if r_array[c] == "@"
          if neighbors < 2
            kill(row_index, c)
          elsif neighbors > 3
            kill(row_index, c)
          else
            birth(row_index, c)
          end
        end
        if r_array[c] == "."
          if neighbors == 3
            birth(row_index, c)
          end
        end
      end
      row_index += 1
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
