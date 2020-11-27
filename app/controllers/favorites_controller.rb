class FavoritesController < ApplicationController
  before_action :set_candidate

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.candidate = @candidate
    @favorite.save
  end

  def destroy
    Favorite.where(user_id: current_user.id, candidate_id: @candidate.id).first.destroy
  end

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end
end
