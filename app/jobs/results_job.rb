require "open-uri"
require "json"

class ResultsJob < ApplicationJob
  queue_as :default

  def perform(group_id)
    root = "http://livescore-api.com/api-client"
    groupstage = "#{ENV['RESULTS_URL']}"
    response = open(root + groupstage + group_id.to_s)
    response_body = response.read
    json = JSON.parse(response_body)

    teams = Team.all
    teams_group = teams.where(group_id: group_id)
    puts "1"
    teams_group.each { |e| p e.name }
    puts "2"
    json["data"]["table"].each do |data|
      if data["name"] == "Morocco"
        placeholder = "Morroco"
        p placeholder
      else
        placeholder = data["name"]
        p placeholder
      end
      p "#{placeholder} is here"

      team = teams_group.where(name: placeholder)
      p team.first
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
