class CandidatesController < ApplicationController
    skip_before_action :authenticate_user!, only: :show
    before_action :set_candidate, only: [:show, :edit, :update, :destroy]

  def show
    if user_signed_in?
    @favorite = Favorite.find_by(user_id: current_user.id, candidate_id: @candidate.id)
    @badge = Badge.new
    @badge.candidate = @candidate
    @badge.user = current_user
    end
  end

  def new
  @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)
    @candidate.user = current_user
    if @candidate.save
      redirect_to @candidate, notice: "Um novo Candidato foi criado."
    else
      render :new
    end
  end

  def update
    if @candidate.update(candidate_params)
      redirect_to @candidate, notice: "As informações do seu candidate foram atualisadas."
    else
      redirect_to root_path
    end
  end

  def destroy
     @candidate.destroy
    redirect_to root_path, notice: "Seu candidato esta fora"
  end

  def edit
  end

  def number_to_currency_br(number)
    number_to_currency(number, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_candidate
    @candidate = Candidate.find(params[:id])
  end


  def candidate_params
    params.require(:candidate).permit(
  :sq_candidate,
  :nr_candidate,
  :name_candidate,
  :party_candidate,
  :nr_party,
  :total_patrimony,
  :ds_coligation_composition,
  :ds_nacionality,
  :birth_dt,
  :ds_gender,
  :ds_marital_status,
  :ds_color_race,
  :ds_ocupation,
  :militancy,
  :acting_region,
  :candidate_ballot_name,
  :email_candidate,
  :running_to,
  :photo
  )
  end
end
