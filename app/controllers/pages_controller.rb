class PagesController < ApplicationController
  def home
    @groups = Group.all
    @teams = Team.all

  end

  def ro16
    @groups = Group.all
    @teams = Team.all
  end

  def faq

  end

  def creators

  end
end
