class PagesController < ApplicationController
  def home
    @groups = Group.all
    @teams = Team.all
    group_ids = [793, 794, 795, 796, 797, 798, 799, 800]
    group_ids.each { |e| ResultsJob.perform_later(e) }
  end

  def faq

  end

  def creators

  end
end
