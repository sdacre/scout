Rails.application.routes.draw do

	resources :places
	  
	resources :places do
		resources :reviews, only: [:index, :edit, :destroy]
	end

  root 'homes#index'
end
