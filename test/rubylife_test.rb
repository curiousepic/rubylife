require "minitest/autorun"
require "rubylife"

class RubylifeTest < MiniTest::Unit::TestCase

  def test_new_world_defaults_to_dead_board_of_given_size
    assert_equal(
    [ [ ".", ".", ".", ".", "." ],
      [ ".", ".", ".", ".", "." ],
      [ ".", ".", ".", ".", "." ],
      [ ".", ".", ".", ".", "." ],
      [ ".", ".", ".", ".", "." ],
      [ ".", ".", ".", ".", "." ],
      [ ".", ".", ".", ".", "." ],
      [ ".", ".", ".", ".", "." ] ],
    World.new(5,8).world)
  end

  def test_display_prints_world_as_string
    game = Rubylife.new
    world = World.new(5,3)
    assert true, (
    ". . . . .\n. . . . .\n. . . . .\n" ==
    game.display(world.world))
  end

  ## Obsolete tests
  #
  # def test_toggle_changes_correct_cell_with_coords
  #   world1 = World.new(3,4)
  #   world1.rules.toggle(1,2, world1.world)
  #   assert_equal(
  #   [
  #     [ ".", ".", "."],
  #     [ ".", ".", "."],
  #     [ ".", "@", "."],
  #     [ ".", ".", "."] ],
  #     world1.world
  #   )
  # end
  #
  # def test_successive_toggles_work
  #   world2 = World.new(3,4)
  #   world2.rules.toggle(0,3, world2.world)
  #   world2.rules.toggle(2,1, world2.world)
  #   world2.rules.toggle(0,2, world2.world)
  #   world2.rules.toggle(0,3, world2.world)
  #   assert_equal(
  #   [
  #     [ ".", ".", "."],
  #     [ ".", ".", "@"],
  #     [ "@", ".", "."],
  #     [ ".", ".", "."] ],
  #     world2.world
  #   )
  # end

  # def test_step_applies_rules_and_generates_next_step
  #   world3 = World.new(3,4)
  #   world3.step
  #   assert_equal(
  #   [
  #     [ ".", ".", "."],
  #     [ ".", "@", "."],
  #     [ ".", ".", "."],
  #     [ ".", ".", "."] ],
  #   world3.world)
  #   world3.step
  #   assert_equal(
  #   [
  #     [ ".", ".", "."],
  #     [ ".", ".", "."],
  #     [ ".", ".", "."],
  #     [ ".", ".", "."] ],
  #   world3.world)
  # end

  def test_count_neighbors_returns_correct_amount
    rules = Rules.new([[".",".","."],[".",".","."],[".",".","."]])
    assert ( 3 == rules.count_neighbors(1,1,
    [[".","@","@"],["@",".","."],[".",".","."]]) )
    assert ( 6 == rules.count_neighbors(1,1,
    [[".","@","@"],[".",".","@"],["@","@","@"]]) )
    assert ( 0 == rules.count_neighbors(1,1,
    [[".",".","."],[".",".","."],[".",".","."]]) )
  end

  def test_count_neighbors_doesnt_break_near_world_edges
    rules = Rules.new([[".",".","."],[".",".","."],[".",".","."]])
    assert ( 2 == rules.count_neighbors(0,1,
    [[".","@","@"],["@",".","."],[".",".","."]]) )
    assert ( 4 == rules.count_neighbors(1,2,
    [[".","@","@"],[".",".","@"],["@","@","@"]]) )
    assert ( 0 == rules.count_neighbors(2,1,
    [[".",".","."],[".",".","."],[".",".","."]]) )
    assert ( 0 == rules.count_neighbors(2,1,
    [[".",".","."],[".",".","."],[".",".","."]]) )
    assert ( 3 == rules.count_neighbors(1,1,
    [[".",".","@"],[".",".","@"],[".",".","@"]]) )
  end

end
