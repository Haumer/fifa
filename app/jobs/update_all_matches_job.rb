class UpdateAllMatchesJob < ApplicationJob
  queue_as :default

  def perform
    url = "http://worldcup.sfg.io/matches/today"
    response = open(url)
    json = JSON.parse(response.read)

    matches = Match.all

    json.each do |element|
      if element["status"] != "future"







      end
    end
  end
end
