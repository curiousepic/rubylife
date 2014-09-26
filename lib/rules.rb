class Rules

  def toggle(x, y, world_state)
    world = world_state
    if world[y][x] == "."
      world[y][x] = "@"
      world
    else
      world[y][x] = "."
      world
    end
  end

  def dummy_rule(world_state)
    new_world_state = toggle(1,1, world_state)
    new_world_state
  end

  def first_rule(world_state)
    # for each cell in each subarray, if alive...
    # check if there are 2 or more adjacent cells alive
    # adjacent cells are:
    #   subarray, index + 1
    #   subarray, index - 1
    #   subarray + 1, index
    #   subarray - 1, index
    # do I need to take world dimensions into account here?
    #
    # I need to have a "next step" array to which I toggle the cells
    # instead of passing the same array with the newly changed cell
    # for each iteration of the rule

    new_world_state
  end

end
