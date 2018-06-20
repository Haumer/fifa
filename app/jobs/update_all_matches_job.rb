require 'open-uri'

class UpdateAllMatchesJob < ApplicationJob
  queue_as :default

  def perform
    url = "http://worldcup.sfg.io/matches"
    response = open(url)
    json = JSON.parse(response.read)

    matches = Match.all

    # morroco_home = matches.where(home_name: "Morocco")
    # morroco_home.first.home_name = "Morroco"
    # morroco_away = matches.where(away_name: "Morocco")
    # morroco_away.first.away_name = "Morroco"

    # morroco_away.first.save
    # morroco_home.first.save

    matches.each do |e|
      e.home_team_goals = 0
      e.away_team_goals = 0
      e.home_team_yellow_cards = 0
      e.away_team_yellow_cards = 0
      e.home_team_red_cards = 0
      e.away_team_red_cards = 0
    end

    json.each do |element|
      if element["status"] != "future"
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

        match_unit = matches.where(home_name: placeholder_home).where(away_name: placeholder_away)

        p match_unit

        p match_unit.first.home_team_goals += element["home_team"]["goals"]
        element["home_team_events"].each do |yellow_event|
          if yellow_event["type_of_event"] == "yellow-card"
            match_unit.first.home_team_yellow_cards += 1
          end
        end

        element["home_team_events"].each do |red_event|
          if red_event["type_of_event"] == "red-card"
            match_unit.first.home_team_red_cards += 1
          end
        end

        p match_unit.first.away_team_goals += element["away_team"]["goals"]
        element["away_team_events"].each do |yellow_event|
          if yellow_event["type_of_event"] == "yellow-card"
            match_unit.first.away_team_yellow_cards += 1
          end
        end

        element["away_team_events"].each do |red_event|
          if red_event["type_of_event"] == "red-card"
            match_unit.first.away_team_red_cards += 1
          end
        end

        match_unit.first.save
      end
    end
  end
end
