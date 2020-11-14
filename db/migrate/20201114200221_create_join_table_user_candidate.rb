class CreateJoinTableUserCandidate < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :candidates do |t|
      t.index [:user_id, :candidate_id]
      t.index [:candidate_id, :user_id]
    end
  end
end
