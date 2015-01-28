class UsersController < ApplicationController
  before_filter :logged_in?, only: [:profile]

  def profile
    @user = current_user
    @media = current_user.user_media_feed()
    render "users/profile"
  end

end

# class UsersController < ApplicationController
#   def index
#   end

#   def new
#   end

#   def show
#   end

#   def edit
#   end
# end
