class AddColsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :username, :string
    add_column :users, :fullname, :string
    add_column :users, :bio, :text
    add_column :users, :counts, :json
    add_column :users, :profile_url, :string
  end
end
