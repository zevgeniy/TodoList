class ChangeDafaultValueInTasks < ActiveRecord::Migration
  def up
		change_column_default(:tasks, :state, false);
		change_column_default(:tasks, :priority, 2);
  end

  def down
		change_column_default(:tasks, :state, nil);
		change_column_default(:tasks, :priority, nil);
  end
end
