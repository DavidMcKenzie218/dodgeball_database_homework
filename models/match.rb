require 'pg'

require_relative('../db/sql_runner')


class Match

  attr_reader :home_team_id, :away_team_id, :home_team_score, :away_team_score, :id

  def initialize(options)
    @home_team_id = options['home_team_id'].to_i
    @away_team_id = options['away_team_id'].to_i
    @home_team_score = options['home_team_score'].to_i
    @away_team_score = options['away_team_score'].to_i
    @id = options['id'].to_i
  end

# This function saves the match to the matches database, sending both teams names and scores. The function then retruns the item from the database as the id is assigned there.

  def save
    sql = "INSERT INTO matches (home_team_id, away_team_id, home_team_score, away_team_score) VALUES (#{@home_team_id}, #{@away_team_id}, #{@home_team_score}, #{@away_team_score}) RETURNING *;"
    match = SqlRunner.run(sql).first
    @id = match['id'].to_i
  end

# This fucntion will delete all of the entries form the matches database.

  def self.delete_all
    sql = "DELETE FROM matches;"
    SqlRunner.run(sql)
  end

# This function will return all of the entries in the database in an array of hashes. the function then maps through them turning them into Match objects.

  def self.all
    sql = "SELECT * FROM matches"
    matches = SqlRunner.run(sql)
    result = matches.map {|match| Match.new(match)}
    return result
  end

end