class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.date :match_date
      t.float :match_importance

      t.timestamps
    end
  end
end
