class AddGuestsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :nights
      t.references :rooms, null: false, foreign_key: true

      t.timestamps
    end
  end
end
