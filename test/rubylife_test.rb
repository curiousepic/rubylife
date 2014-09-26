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

  def test_toggle_changes_correct_cell_with_coords
    world1 = World.new(3,4)
    world1.toggle(1,2)
    assert_equal(
    [
      [ ".", ".", "."],
      [ ".", ".", "."],
      [ ".", "@", "."],
      [ ".", ".", "."] ],
      world1.world
    )
  end

  def test_successive_toggles_work
    world2 = World.new(3,4)
    world2.toggle(0,3)
    world2.toggle(2,1)
    world2.toggle(0,2)
    world2.toggle(0,3)
    assert_equal(
    [
      [ ".", ".", "."],
      [ ".", ".", "@"],
      [ "@", ".", "."],
      [ ".", ".", "."] ],
      world2.world
    )
  end

  def test_step_applies_rules_and_generates_next_step
    world3 = World.new(3,4)
    world3.step
    assert_equal(
    [
      [ ".", ".", "."],
      [ ".", "@", "."],
      [ ".", ".", "."],
      [ ".", ".", "."] ],
    world3.world)
    world3.step
    assert_equal(
    [
      [ ".", ".", "."],
      [ ".", ".", "."],
      [ ".", ".", "."],
      [ ".", ".", "."] ],
    world3.world)
  end

  # def test_killall_rule_kills_all_live_cells
  #   world4 = World.new(3,4)
  #   world4.toggle(1,1)
  #   world4.toggle(2,2)
  #   world4.step
  #   assert_equal(
  #   [
  #     [ ".", ".", "."],
  #     [ ".", ".", "."],
  #     [ ".", ".", "."],
  #     [ ".", ".", "."] ],
  #     world3.world
  #   )
  # end

end