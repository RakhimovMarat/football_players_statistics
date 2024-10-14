class CreateStatistics < ActiveRecord::Migration[7.1]
  def change
    create_table :statistics do |t|
      t.integer :saves
      t.integer :clean_sheets
      t.integer :goals
      t.integer :assists
      t.integer :shots
      t.integer :shots_on_target
      t.integer :tackles
      t.integer :passes
      t.references :player, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
