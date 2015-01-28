class CreateCollectionPhotos < ActiveRecord::Migration
  def change
    create_table :collection_photos do |t|
      t.string :coll_id
      t.string :photo_id

      t.timestamps null: false
    end
  end
end
