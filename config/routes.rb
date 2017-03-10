Rails.application.routes.draw do

  root 'homes#index'

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  
end
