require "open-uri"
require "json"

class ResultsJob < ApplicationJob
  queue_as :default

  def perform
    group_ids = [793, 794, 795, 796, 797, 798, 799, 800]
    group_ids.each do |group_id|
      root = "http://livescore-api.com/api-client"
      groupstage = "#{ENV['RESULTS_URL']}"
      response = open(root + groupstage + group_id.to_s)
      response_body = response.read
      json = JSON.parse(response_body)

      teams = Team.all
      teams_group = teams.where(group_id: group_id)

      json["data"]["table"].each do |data|
          if data["name"] == "Morocco"
            placeholder = "Morroco"
            puts "placeholder is #{placeholder}"
          elsif data["name"] == "Korea Republic"
            placeholder = "South Korea"
            puts "placeholder is #{placeholder}"
          else
            placeholder = data["name"]
            puts "placeholder is #{placeholder}"
          end
          puts "im here #{placeholder}"
        team = teams_group.where(name: placeholder)
        team.first.wins = data["won"]
        team.first.losses = data["lost"]
        team.first.draws = data["drawn"]
        team.first.points = data["points"]
        team.first.goals_for = data["goals_scored"]
        team.first.goals_against = data["goals_conceded"]
        team.first.save
      end
    end
  end
end
