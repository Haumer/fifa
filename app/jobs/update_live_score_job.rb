class UpdateLiveScoreJob < ApplicationJob
  queue_as :default

  def perform(match_id)
    match_unit = Match.find(match_id)
    p match_unit["home_team_goals"] = 1
    match_unit.save
  end
end
