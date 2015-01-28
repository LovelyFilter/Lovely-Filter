class User < ActiveRecord::Base

	def client
		@client ||= Instagram.client(:access_token => access_token)
	end


	def instagram_user()
    user_params = client.user
    user_params[:user_id] = user_params[:id]
    user_params.reject { | key , _| !User.column_names.include?(key) || key == "id"}
  end

  def method_missing(m, *args, &block)
  	@client.method(m).call(*args, &block)
	end
end
