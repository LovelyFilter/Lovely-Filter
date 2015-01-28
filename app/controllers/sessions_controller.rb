class SessionsController < ApplicationController 

  def oauth_connect
    instagram_authorize()
  end


  def oauth_callback
    login(params[:code])
    redirect_to profile_path
  end

  def destroy
  	logout()
  	redirect_to root_path
  end



end