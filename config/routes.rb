Rails.application.routes.draw do
  devise_for :users
  resources :messages do
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :pics do 

  	member do
  		put "like", to: "pics#upvote"
  	end
  	member do
  		put "dislike", to: "pics#downvote"
  	end
  	resources :comments do
  	end

  end
  root 'pics#index'
end
