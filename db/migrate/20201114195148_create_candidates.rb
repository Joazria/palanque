class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :sq_candidate
      t.string :nr_candidate
      t.string :name_candidate
      t.string :party_candidate
      t.string :nr_party
      t.string :total_patrimony
      t.string :ds_coligation_composition
      t.string :ds_nacionality
      t.string :birth_dt
      t.string :ds_gender
      t.string :ds_marital_status
      t.string :ds_color_race
      t.string :ds_ocupation
      t.text :militancy
      t.string :acting_region
      t.string :candidate_ballot_name
      t.string :email_candidate
      t.string :running_to

      t.timestamps
    end
  end
end
