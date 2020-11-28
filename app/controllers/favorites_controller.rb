class FavoritesController < ApplicationController
  before_action :set_candidate, except: :destroy
  before_action :set_favorite, only: :destroy

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
    @favorite.destroy
  end

  def set_candidate
    @candidate = Candidate.find(params[:candidate_id])
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end
end
