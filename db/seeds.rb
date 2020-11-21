# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'db/candidatos.csv'

CSV.foreach(filepath, csv_options) do |row|
  file_name = "FSP#{row["SQ_CANDIDATO"]}_div.jpg"
  file = "public/photos/FSP#{row["SQ_CANDIDATO"]}_div.jpg"
  candidate = Candidate.create(
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

   candidate.photo.attach(io: open(file), filename: file_name, content_type: 'image/jpg')

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

# candidate = Candidate.new(
#     sq_candidate: "1234456",
#     nr_candidate: "1223345",
#     name_candidate: "BETINHO CARALHOU",
#     party_candidate: "SEM PARTIDO",
#     nr_party: "1620",
#     total_patrimony: "100",
#     ds_coligation_composition: "VERDE MACONHEIRO",
#     ds_nacionality: "DO MUNDO",
#     birth_dt: "14/03/1735",
#     ds_gender: "indefinido",
#     ds_marital_status: "quem sabe",
#     ds_color_race: "Não tenho race, que não sou cachoro",
#     ds_ocupation: "ocupado demais",
#     education: "MACONHEIRO GRAUD 1",
#     candidate_ballot_name: "BB Betinho the Best",
#     email_candidate: "nãomecontato@pora.com",
#     running_to: "apertador de beck"
#   )
#     candidate.photo.attach(io: open('db/photos/FSP250000658458_div.jpg'), filename: 'FSP250000658458_div.jpg')
#     candidate.save

