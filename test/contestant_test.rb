require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/contestant'

class ContestantTest < Minitest::Test
  def setup
    @alexander = Contestant.new({first_name: 'Alexander',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'CO',
                                      spending_money: 10})
  end

  def test_it_exists
    assert_instance_of Contestant, @alexander
  end

  def test_it_has_attributes
    assert_equal "Alexander Aigiades", @alexander.full_name
    assert_equal 28, @alexander.age
    assert_equal "CO", @alexander.state_of_residence
    assert_equal 10, @alexander.spending_money
    assert_equal [], @alexander.game_interests
  end

  def test_it_can_report_out_of_state
    assert_equal false, @alexander.out_of_state?

    alex = Contestant.new({first_name: 'Alex',
                                      last_name: 'Aigiades',
                                      age: 28,
                                      state_of_residence: 'SD',
                                      spending_money: 10})


    assert_equal true, alex.out_of_state?
  end

  def test_it_can_add_game_interest
    @alexander.add_game_interest('Mega Millions')
    @alexander.add_game_interest('Pick 4')

    assert_equal ["Mega Millions", "Pick 4"], @alexander.game_interests
  end
end
