class RemoveProfileUrlFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile_url, :string
  end
end
