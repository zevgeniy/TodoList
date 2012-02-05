class AddCompletedByToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completed_by_user, :integer
  end
end
