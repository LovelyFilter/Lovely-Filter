class RemoveColsFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :user_id, :string
    remove_column :users, :user_username, :string
    remove_column :users, :user_full_name, :string
  end
end
