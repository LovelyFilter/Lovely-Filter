class CollectionPhoto < ActiveRecord::Base
	belongs_to :collections
	belongs_to :photos
end
