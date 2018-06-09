Rails.application.routes.draw do
  resources :galleries
  root 'galleries#index'
end
