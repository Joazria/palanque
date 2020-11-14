class AddReferencesToBadge < ActiveRecord::Migration[6.0]
  def change
    add_reference :badges, :user, null: false, foreign_key: true
    add_reference :badges, :candidate, null: false, foreign_key: true
  end
end
