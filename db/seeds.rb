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
  Candidate.create(
    sq_candidate: row["SQ_CANDIDATO"],
    nr_candidate: row["NR_CANDIDATO"],
    name_candidate: row["NOME_CANDIDATO"].downcase.titleize,
    party_candidate: row["PARTIDO_CANDIDATO"],
    nr_party: row["NR_PARTIDO"],
    total_patrimony: row["PATRIMONIO_TOTAL"],
    ds_coligation_composition: row["DS_COMPOSICAO_COLIGACAO"],
    ds_nacionality: row["DS_NACIONALIDADE"].downcase.titleize,
    birth_dt: row["DT_NASCIMENTO"],
    ds_gender: row["DS_GENERO"].downcase.capitalize,
    ds_marital_status: row["DS_ESTADO_CIVIL"].downcase.capitalize,
    ds_color_race: row["DS_COR_RACA"].downcase.titleize,
    ds_ocupation: row["DS_OCUPACAO"].downcase.titleize,
    education: row["DS_GRAU_INSTRUCAO"].downcase.titleize,
    candidate_ballot_name: row["NM_URNA_CANDIDATO"].downcase.titleize,
    email_candidate: row["EMAIL"].downcase,
    running_to: row["DS_CARGO"].downcase.titleize
  )

  puts "#{row["NOME_CANDIDATO"]} criado"
end

filepath = 'db/bens_candidatos.csv'

CSV.foreach(filepath, csv_options) do |row|
  candidate = Candidate.find_by sq_candidate: row["SQ_CANDIDATO"]
  Property.create(
    property_type: row["DS_TIPO_BEM_CANDIDATO"],
    description: row["DS_BEM_CANDIDATO"],
    value: row["VR_BEM_CANDIDATO"],
    candidate_id: candidate.id
  )

  puts "Bem de #{candidate.candidate_ballot_name} criado"
end
