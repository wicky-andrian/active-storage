Rails.application.routes.draw do
  resources :galleries do
  	member do
  		delete :delete_image
  		
  	end
  end
  root 'galleries#index'
end
