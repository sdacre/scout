Rails.application.routes.draw do

	resources :places

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, only: [:create, :show, :edit, :update, :index] do
    resource :password, controller: "clearance/passwords", only: [:create, :edit, :update]
  end

  resources :places, controller: "places" do
    resources :reviews, only: [:new, :create, :edit, :destroy]

	end
	resources :cities, controller: "cities", except: [:show]


  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  # delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  # get "/sign_up" => "clearance/users#new", as: "sign_up"


  root 'homes#index'

  get "/auth/:strava/callback" => "sessions#strava_from_omniauth"
  get "/auth/:facebook/callback" => "sessions#create_from_omniauth"

end
