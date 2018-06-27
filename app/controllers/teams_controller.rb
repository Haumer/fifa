class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def hype
    # @teams = Team.all
    @teams = Team.all.order(:cached_votes_score => :desc)
  end

  def upvote
    @team = Team.find(params[:id])
    @team.upvote_from current_user
    redirect_back fallback_location: root_path
  end

  def downvote
    @team = Team.find(params[:id])
    @team.upvote_from current_user
    redirect_to fallback_location: root_path
  end

end
