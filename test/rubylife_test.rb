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
    "\n.....\n.....\n.....\n" ==
    World.new(5,3).display)
  end

end
