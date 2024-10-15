class AddRoleToStatistics < ActiveRecord::Migration[7.1]
  def change
    add_reference :statistics, :role, null: false, foreign_key: true
  end
end
