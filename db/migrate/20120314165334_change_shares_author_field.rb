class ChangeSharesAuthorField < ActiveRecord::Migration
  def up
		change_column_default(:shares, :author, false);
  end

  def down
		change_column_default(:shares, :author, nil);
  end
end
