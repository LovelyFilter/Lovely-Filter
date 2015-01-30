module SessionsHelper
  # Assuming you have the route in routes.rb
  # get "/oauth/callback", to: "sessions#callback"
  CALLBACK_URL = "https://insterest.herokuapp.com/oauth/callback"

  # also on instagram's API management 
  #   you should configure your oauth
  #   callback to match the one above,
  #   at least while in development.


  def instagram_authorize()
     redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def login(code)
    res = Instagram.get_access_token(code, redirect_uri: CALLBACK_URL)

    user_params = fetch_instagram_user(res.access_token)

    @current_user =  User.find_by({username: user_params[:username]})

    ## Update or Create a current_user
    unless @current_user
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
    user_params[:access_token] = access_token
    user_params.reject { | key , _| !User.column_names.include?(key) || key == "id"}
  end

  def current_user
    @current_user ||= User.find_by({id: session[:user_id]})
    @current_user.client
    @current_user
  end
end