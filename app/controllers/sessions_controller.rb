class SessionsController < Clearance::SessionsController
    def strava_from_omniauth
      auth_hash = request.env['omniauth.auth']
      authentication = Authentication.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid'])|| Authentication.create_with_omniauth(auth_hash)
      if authentication.user
          user = authentication.user
          authentication.update_token(auth_hash)
          @next = user_path(user)
          @notice = 'Please wait a moment while Strava migrates your information!'
        elsif authentication.user.nil?
            authentication.user_id = current_user.id
            authentication.update_token(auth_hash)
           @next = user_path(current_user)
           @notice = 'Sorry! You must have a Strava Account to use this feature.'
         else
        @next = user_path(current_user)
        @notice = 'Sorry! You must have a Strava Account to use this feature.'
     end
     redirect_to @next, notice: @notice
   end

    def create_from_omniauth
        auth_hash = request.env['omniauth.auth']
        authentication = Authentication.find_by_provider_and_uid(auth_hash['provider'], auth_hash['uid']) || Authentication.create_with_omniauth(auth_hash)
        if authentication.user
            user = authentication.user
            authentication.update_token(auth_hash)
            @next = root_url
            @notice = 'Signed in!'
        else
            user = User.create_with_auth_and_hash(authentication, auth_hash)
            @next = edit_user_path(user)
            @notice = 'User created - confirm or edit details...'
        end
        sign_in(user)
        redirect_to @next, notice: @notice
    end
end
