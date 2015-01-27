module SessionsHelper
  # Assuming you have the route in routes.rb
  # get "/oauth/callback", to: "sessions#callback"
  CALLBACK_URL = "http://localhost:3000/oauth/callback"

  # also on instagram's API management 
  #   you should configure your oauth
  #   callback to match the one above,
  #   at least while in development.

  Instagram.configure do |config|
    config.client_id = ENV["CLIENT_ID"] # <--- NOTE THE CHANGE
    config.client_secret = ENV["CLIENT_SECRET"] #<---- NOTE THE CHANGE
    # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

    
  def instagram_authorize()
     redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def login(code)
      # Once user authenticates
    #  their access_token
    #  will be made available
    #  in the response to this
    #  method...
    res = Instagram.get_access_token(code, redirect_uri: CALLBACK_URL)
    # The access token 
    # is then put into the
    # session
    session[:access_token] = res.access_token
  end

  def logout
    session[:access_token] = nil
  end

  def logged_in?
    if session[:access_token].nil?
      redirect_to root_path
    end
  end

  def current_user
    client ||= Instagram.client(:access_token => session[:access_token])
    client.user
  end
end