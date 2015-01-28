class PhotosController < ApplicationController

	def photo_page
		if params[:next_max_id] == "0"
			@page = current_user.user_media_feed
		else
			@page = current_user.user_media_feed max_id: params[:next_max_id]
		end
		p @page
		puts "HEERE"
		# @media = current_user.like_media
		# @media = current_user.unlike_media
		render json: {photos: @page, next_max_id: @page.pagination.next_max_id}
	end
end
