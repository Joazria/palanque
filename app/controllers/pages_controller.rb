class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @candidates = Candidate.all
    # @search = params["search"]
    # if @search.present?
    #   @name = @search["name"]
    #   @candidates = Candidate.where(candidate_ballot_name: @name)
    # end
  end
end
