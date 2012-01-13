class CreateTesks < ActiveRecord::Migration
  def change
    create_table :tesks do |t|
      t.string :name
      t.text :description
      t.boolean :state
      t.integer :priority
      t.integer :list_id

      t.timestamps
    end
  end
end
