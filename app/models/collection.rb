class Collection < ActiveRecord::Base
	has_many :collection_photos
	belongs_to :user
end
