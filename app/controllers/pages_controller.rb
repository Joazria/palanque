class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home

    if params[:query].present?
      @candidates = Candidate.search_by_candidate_ballot_name_and_party_candidate(params[:query])
    else
      @candidates = Candidate.all
    end
  end
end
