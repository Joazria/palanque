class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :type
      t.text :description
      t.float :value
      t.references :candidate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
