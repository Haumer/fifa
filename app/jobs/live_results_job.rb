require 'open-uri'

class LiveResultsJob < ApplicationJob
  queue_as :default

  def perform

    url = "http://worldcup.sfg.io/matches"
    response = open(url)
    json = JSON.parse(response.read)

    teams = Team.all

    teams.each do |team|
      team.wins = 0
      team.losses = 0
      team.goals_for = 0
      team.goals_against = 0
      team.draws = 0
      team.points = 0
      team.yellow_card = 0
      team.red_card = 0
      team.save
    end

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

      if element["status"] != "future"

        # Home team

        team_home = teams.where(name: placeholder_home)
        if element["winner"] == placeholder_home
          team_home.first.wins += 1
          team_home.first.points += 3
        elsif element["winner"] == placeholder_away
          team_home.first.losses += 1
        elsif element["winner"] == "Draw"
          team_home.first.draws += 1
          team_home.first.points += 1
        end

        element["home_team_events"].each do |yellow_event|
          if yellow_event["type_of_event"] == "yellow-card"
            team_home.first.yellow_card += 1
          end
        end

        element["home_team_events"].each do |red_event|
          if red_event["type_of_event"] == "red-card"
            team_home.first.red_card += 1
          end
        end

        team_home.first.goals_for += element["home_team"]["goals"]
        team_home.first.goals_against += element["away_team"]["goals"]
        team_home.first.save
        puts team_home.first

        # Away team

        team_away = teams.where(name: placeholder_away)
        if element["winner"] == placeholder_away
          team_away.first.wins += 1
          team_away.first.points += 3
        elsif element["winner"] == placeholder_home
          team_away.first.losses += 1
        elsif element["winner"] == "Draw"
          team_away.first.draws += 1
          team_away.first.points += 1
        end

        element["away_team_events"].each do |yellow_event|
          if yellow_event["type_of_event"] == "yellow-card"
            team_away.first.yellow_card += 1
          end
        end

        element["away_team_events"].each do |red_event|
          if red_event["type_of_event"] == "red-card"
            team_away.first.red_card += 1
          end
        end

        team_away.first.goals_for = element["away_team"]["goals"]
        team_away.first.goals_against = element["home_team"]["goals"]
        team_away.first.save
        puts team_away.first
      end
    end
  end
end
