class ApplicationJob < ActiveJob::Base
  def perform(match_id)
    match_unit = Match.find(match_id)
    p match_unit
  end
end
