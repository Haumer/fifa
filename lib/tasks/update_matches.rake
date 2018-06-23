
namespace :fifa do
  task update_all: :environment do
    desc "Job to update all stats"
    puts "Updating..."
    UpdateAllMatchesJob.perform_later
    LiveResultsJob.perform_later
    puts "Done"
  end
end
