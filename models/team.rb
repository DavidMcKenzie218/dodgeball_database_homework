require 'pg'

require_relative('../db/sql_runner')


class Team

  attr_reader :name, :id

  def initialize(options)
    @name = options['name']
    @id = options['id'].to_i
  end

# This function saves the teams to the database from the has that is passed into the initialie function. It only sends the teams name as the id is handled by the database. To get the id the RETURNING * sql call is made to return the database entry for the item so that the id can be collected.

  def save
    sql = "INSERT INTO teams (name) VALUES ('#{@name}') RETURNING *;"
    team = SqlRunner.run(sql).first
    @id = team['id'].to_i
  end

  # This function will delete all of the items in the teams database. Thiw will help during testing as it prevents the database getting clogged up.

  def self.delete_all
    sql = "DELETE FROM teams;"
    SqlRunner.run(sql)
  end

# This function will return all of the items in the teams database and willmap throught the array of hashes to make them all objects by passing them back into the Team Class.

  def self.all
    sql = "SELECT * FROM teams;"
    teams = SqlRunner.run(sql)
    result = teams.map {|team| Team.new(team)}
    return result
  end

end