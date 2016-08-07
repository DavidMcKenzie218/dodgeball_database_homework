require 'pry-byebug'

require_relative './team'

class League

  def initialize(league_data)
    @league_data = league_data
    # binding.pry
    # nil
  end

  # This function searches through the league data and finds the corrispondingh id of the desired id and add the teams score from that match to the total and then returns the total score

  def total_team_score(teams_id)
    total_score = 0
    @league_data.each do
      |team| 
      # binding.pry
      if team.home_team_id == teams_id
        total_score += team.home_team_score
      elsif team.away_team_id == teams_id
        total_score += team.away_team_score
      end
    end
    return total_score
  end

  def total_matches_played
    matches_played = @league_data.count
    return matches_played
  end

end