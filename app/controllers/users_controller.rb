class UsersController < Clearance::UsersController
	require 'strava/api/v3'


	def show
		@auth = current_user.authentications.find_by(provider: "strava") if current_user
		@client = Strava::Api::V3::Client.new(:access_token => @auth.token) if @auth
		@runs = @client.list_athlete_activities if @client
		@user = User.find(params[:id])
		@u_reviews = Review.where(user_id: params[:id])
		render template: 'users/show'
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

	def index
		@users = User.all
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
