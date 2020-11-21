class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      sql_query = "candidate_ballot_name ILIKE :query OR party_candidate ILIKE :query"
      @candidates = Candidate.where(sql_query, query: "%#{params[:query]}%")
    else
      @candidates = Candidate.all
    end
  end
end
