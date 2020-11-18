# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'db/candidatos.csv'

CSV.foreach(filepath, csv_options) do |row|
  candidate = Candidate.create(
  sq_candidate: row["SQ_CANDITATO"],
  nr_candidate: row["NR_CANDIDATO"],
  name_candidate: row["NOME_CANDIDATO"],
  party_candidate: row["PARTIDO_CANDIDATO"],
  nr_party: row["NR_PARTIDO"],
  total_patrimony: row["PATRIMONIO_TOTAL"],
  ds_coligation_composition: row["DS_COMPOSICAO_COLIGACAO"],
  ds_nacionality: row["DS_NACIONALIDADE"],
  birth_dt: row["DT_NASCIMENTO"],
  ds_gender: row["DS_GENERO"],
  ds_marital_status: row["DS_ESTADO_CIVIL"],
  ds_color_race: row["DS_COR_RACA"],
  ds_ocupation: row["DS_OCUPACAO"],
  candidate_ballot_name: row["NM_URNA_CANDIDATO"],
  email_candidate: row["EMAIL"],
  running_to: row["DS_CARGO"])

  puts "#{candidate.candidate_ballot_name} criado"
end
