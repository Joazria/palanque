class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @candidates = Candidate.search_by_candidate_ballot_name_and_party_candidate(params[:query])
    else
      @candidates = Candidate.all
    end
  end

  def profile
    @favorite = Favorite.where(user_id: current_user.id)
    # @candidates = Candidate.includes(:favorites).where("favorites.user_id = ?", current_user.id)
    @candidates = Candidate.includes(:favorites).where(favorites: { user_id: current_user.id })
  end

  def all
   @candidates = Candidate.all
  end
end
