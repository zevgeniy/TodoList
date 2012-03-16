class CreateShares < ActiveRecord::Migration
  def change
    create_table :shares do |t|
      t.integer :project_id
      t.integer :user_id
      t.boolean :author

      t.timestamps
    end
  end
end
