class FavoritesController < ApplicationController

  def create
    @candidate = Candidate.find(params[:candidate_id])
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.candidate = @candidate
    if @favorite.save
    redirect_to candidate_path(@candidate)
    end

  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
    redirect_back(fallback_location: candidate_path(@favorite.candidate,
      anchor: "candidate_#{@favorite.candidate.id}"))
    end

  end

end
