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

    res = Instagram.get_access_token(code, redirect_uri: CALLBACK_URL)

    user_params = fetch_instagram_user(res.access_token)
    #raise user_params.inspect

    # raise user_params.inspect
    @current_user =  User.find_by({username: user_params[:username]})

    ## Update or Create a current_user
    unless @current_user
      #raise user_params.inspect
      @current_user = User.create!(user_params)
    else
      @current_user.update(user_params)
    end
    session[:user_id] = @current_user.id
    current_user
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def logged_in?
    if current_user.nil?
      redirect_to root_path
    end
  end

  def fetch_instagram_user(access_token)
    client = Instagram.client(:access_token => access_token)
    user_params = client.user
    user_params[:user_id] = user_params[:id]
    user_params.reject { | key , _| !User.column_names.include?(key) || key == "id"}
  end

  def current_user
    @current_user ||= User.find_by({id: session[:user_id]})
  end
end