Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :matches do
    collection do
      get "hype", to: "matches#hype"
    end
    member do
      put "like" => "matches#upvote"
      put "unlike" => "matches#downvote"
    end
  end
  resources :groups
  resources :teams do
    collection do
      get "hype", to: "teams#hype"
    end
    member do
      put "like" => "teams#upvote"
      put "unlike" => "teams#downvote"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
