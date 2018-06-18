require 'open-uri'

class LiveResultsJob < ApplicationJob
  queue_as :default

  def perform

    url = "http://worldcup.sfg.io/matches/today"
    response = open(url)
    json = JSON.parse(response.read)

    teams = Team.all

    json.each do |element|
      p element
      if element["home_team"]["country"] == "Morocco"
        placeholder_home = "Morroco"
        puts "placeholder_home is #{placeholder_home}"
      elsif element["home_team"]["country"] == "Korea Republic"
        placeholder_home = "South Korea"
        puts "placeholder_home is #{placeholder_home}"
      else
        placeholder_home = element["home_team"]["country"]
        puts "placeholder_home is #{placeholder_home}"
      end

      if element["away_team"]["country"] == "Morocco"
        placeholder_away = "Morroco"
        puts "placeholder_away is #{placeholder_away}"
      elsif element["away_team"]["country"] == "Korea Republic"
        placeholder_away = "South Korea"
        puts "placeholder_away is #{placeholder_away}"
      else
        placeholder_away = element["away_team"]["country"]
        puts "placeholder_away is #{placeholder_away}"
      end

      puts "im here #{placeholder_home}"



      team_home = teams.where(name: placeholder_home)
      if element["winner"] == placeholder_home
        team_home.first.wins = 1
        team_home.first.points = 3
      elsif element["winner"] == placeholder_away
        team_home.first.losses = 1
      elsif element["winner"] == "Draw"
        team_home.first.draws = 1
        team_home.first.points = 1
      end
      team_home.first.goals_for = element["home_team"]["goals"]
      team_home.first.goals_against = element["away_team"]["goals"]
      team_home.first.save
      puts team_home.first

      team_away = teams.where(name: placeholder_away)
      if element["winner"] == placeholder_away
        team_away.first.wins = 1
        team_away.first.points = 3
      elsif element["winner"] == placeholder_home
        team_away.first.losses = 1
      elsif element["winner"] == "Draw"
        team_away.first.draws = 1
        team_away.first.points = 1
      end
      team_away.first.goals_for = element["home_team"]["goals"]
      team_away.first.goals_against = element["away_team"]["goals"]
      team_away.first.save
      puts team_away.first
    end
  end
end
