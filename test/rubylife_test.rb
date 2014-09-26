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
    assert true, (
    ". . . . .\n. . . . .\n. . . . .\n" ==
    World.new(5,3).display)
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

  # def test_successive_toggles_work
  # end

  # def test_can_return_a_cell_with_coorinates
  #   world = [
  #     [ ".", ".", "."],
  #     [ ".", ".", "@"],
  #     [ ".", ".", "."],
  #     [ ".", ".", "."]
  #   ]
  #   assert_equal "@",


end
