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

  def dummy_rule(world)
    if world[1][1] == "."
      birth(1, 1)
    else
      kill(1, 1)
    end
  end

  def first_rule(world)
    # I need to have a "next step" array to which I toggle the cells
    # instead of passing the same array with the newly changed cell
    # for each iteration of the rule

    # for each cell in each subarray, if alive...
    # check if there are 2 or more adjacent cells alive
    # adjacent cells are:
    #   subarray, index - 1
    #   subarray, index + 1
    #   subarray + 1, index - 1
    #   subarray + 1, index
    #   subarray + 1, index + 1
    #   subarray - 1, index - 1
    #   subarray - 1, index
    #   subarray - 1, index + 1
    #
    # then if it dies, toggle that location in the next world state
    #
    # the above is the "first rule", but can these different rules be
    # applied individually and in sequence without messing them up?
    # maybe I need to make a single rule that takes all of the
    # given rules into account but take place in a single method/pass

    #     Any live cell with fewer than two live neighbors dies, as if caused by under-population.
    # Any live cell with two or three live neighbors lives on to the next generation.
    # Any live cell with more than three live neighbors dies, as if by overcrowding.
    # Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

    # if
    #

    # do I need to take world dimensions into account here?

  end

end
