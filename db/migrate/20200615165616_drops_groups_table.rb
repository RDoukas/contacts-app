class DropsGroupsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :groups
  end
end
