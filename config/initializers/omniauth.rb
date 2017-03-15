Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET']
  provider :strava, ENV['STRAVA_CLIENT_ID'], ENV['STRAVA_CLIENT_SECRET'], scope: "view_private", callback_url: "http://localhost:3000/users/auth/strava/callback"
end
