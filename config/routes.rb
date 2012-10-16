YakTracker::Application.routes.draw do
  root :to => 'home#index'

  resources :map, :only => [:index]
  #resources :guesses, :only => [:new, :create]
  resources :messages, :only => [:new, :create]

  get "guesses/validate" => "validate_guess#edit", :as => :validate_guess
  post "guesses/validate" => "validate_guess#update"

  get 'delete_cache' => "delete_cache#index", :as => :delete_cache
end
