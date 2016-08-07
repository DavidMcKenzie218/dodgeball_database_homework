require_relative './models/match'
require_relative './models/team'
require_relative "./models/league"

require 'pry-byebug'

Match.delete_all()
Team.delete_all()

team_hawks = Team.new({'name' => 'The Hillbilly Hawks'})
team_alpakas = Team.new({'name' => 'The Spitting Alpakas'})

team_hawks.save()
team_alpakas.save()

match1 = Match.new({'home_team_id' => team_hawks.id, 'away_team_id' => team_alpakas.id, 'home_team_score' => 25, 'away_team_score' => 31})
match2 = Match.new({'home_team_id' => team_alpakas.id, 'away_team_id' => team_hawks.id, 'home_team_score' => 17, 'away_team_score' => 16})

match1.save()
match2.save()

new_league = League.new(Match.all())
hawks_total_score = new_league.total_team_score(team_hawks.id)
alpakas_total_score = new_league.total_team_score(team_alpakas.id)

puts hawks_total_score
puts alpakas_total_score


binding.pry
nil