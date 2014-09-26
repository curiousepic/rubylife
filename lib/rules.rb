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

end
