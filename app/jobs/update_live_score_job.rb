require "open-uri"
require "json"

class UpdateLiveScoreJob < ApplicationJob
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
        team = teams_group.where(name: data["name"])
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
