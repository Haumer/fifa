require "open-uri"
require "json"

class UpdateLiveScoreJob < ApplicationJob
  queue_as :default

  def perform(*group_id)

  end
end
