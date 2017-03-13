class UsersController < Clearance::UsersController

	def show
		@user = User.find(params[:id])
		@place = Place.all
	end

	def edit
		@user = User.find(params[:id])
	end

  def update
  	@user = User.find(params[:id])
	  	if @user.update(user_params)
	  		@notice = "User updated!"
			else
				@notice = "User update FAILED"
			end
    redirect_to user_path(@user), :notice => @notice
  end

	def new

	end


	def create
		@user = User.new(user_params)
		  if @user.save
		  	@notice = "User created!"
			else
				@notice = "User creation FAILED"
			end
		 redirect_to root_path, :notice => @notice
	end


	private
		def user_params
			params.require(:user).permit(:email,
																	 :username,
																	 :first_name,
																	 :last_name,
																	 :password,
																	 :profile,
																	 :remove_profile)
		end
end
