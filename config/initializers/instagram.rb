  Instagram.configure do |config|
    config.client_id = ENV["CLIENT_ID"] # <--- NOTE THE CHANGE
    config.client_secret = ENV["CLIENT_SECRET"] #<---- NOTE THE CHANGE
    # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

    