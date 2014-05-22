class ChangeUserNameLength < ActiveRecord::Migration
  def up
    change_column :users, :user_name, :string, :limit => 15
  end

  def down
  end
end
