class ResultsJob < ApplicationJob
  queue_as :default

  def perform(*group_id)
    root = "http://livescore-api.com/api-client"
    groupstage = "#{ENV['RESULTS_URL']}"
    response = open(root + groupstage + group_id.to_s)
    response_body = response.read
    json = JSON.parse(response_body)

    teams = Team.all
    teams_group = teams.where(group_id: group_id)
    puts "1"
    json["data"]["table"].each do |data|
      if data["name"] == "Morroco"
        placeholder = Morocco
      else
        placeholder = data["name"]
      end
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
