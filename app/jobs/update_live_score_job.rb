class UpdateLiveScoreJob < ApplicationJob
  queue_as :default

  def perform(match_id)
    match_unit = Match.find(match_id)


  end
end
