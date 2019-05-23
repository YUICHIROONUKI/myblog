Rails.application.routes.draw do
  devise_for :users
	root 'users#index'
	resources :articles
	resources :users, only: [:index, :show]
	resources :ages, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
