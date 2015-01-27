class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :access_token
      t.string :user_id
      t.string :user_username
      t.string :user_full_name

      t.timestamps null: false
    end
  end
end
