class DeleteTesks < ActiveRecord::Migration
  def up
  drop_table :tesks
  end

  def down
  end
end
