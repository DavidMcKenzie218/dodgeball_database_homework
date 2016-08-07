require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/match'
require_relative '../models/league'

class TestLeague < MiniTest::Test

  def setup 
    match_test_home = Match.new({'home_team_id' => 1, 'away_team_id' => 2, 'home_team_score' => 17, 'away_team_score' => 16})
    match_test_away = Match.new({'home_team_id' => 2, 'away_team_id' => 1, 'home_team_score' => 10, 'away_team_score' => 13})
    @test_league_data = League.new([match_test_home, match_test_away])
  end

  def test_total_team_score
    assert_equal(30, @test_league_data.total_team_score(1))
  end

  # Test passed

  def test_total_second_team_score
    assert_equal(26, @test_league_data.total_team_score(2))
  end
  # Test Passed

  def test_count_matches_played
    assert_equal(2, @test_league_data.total_matches_played)
  end

  # Test passed

end