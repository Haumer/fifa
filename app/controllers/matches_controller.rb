class MatchesController < ApplicationController

  def index
    @matches = Match.all
    @matches_order = Match.all.order(:cached_votes_score => :desc)
  end

  def show
    @match = Match.find(params[:id])
  end

  def hype
    @matches = Match.all.order(:cached_votes_score => :desc)
  end

  def upvote
    @match = Match.find(params[:id])
    @match.upvote_from current_user
    redirect_back(fallback_location: root_path)
  end

  def downvote
    @match = Match.find(params[:id])
    @match.upvote_from current_user
    redirect_to hype_matches_path
  end

end
