class BadgesController < ApplicationController

  def new
    @badge = Badge.new
  end


  def create
    @candidate = Candidate.find(params[:candidate_id])
    @badge = Badge.new(badge_params)
    @badge.user = current_user
    @badge.candidate = @candidate
    if @badge.save
    redirect_to candidate_path(@candidate)
    end

  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    redirect_back(fallback_location: candidate_path(@badge.candidate,
      anchor: "candidate_#{@badge.candidate.id}"))

  end

  private

  def badge_params
    params.require(:badge).permit(:name)
  end
end
