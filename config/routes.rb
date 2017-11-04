Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "messages#index"

  resource :messages, only: [:new, :create] do
  resources :texts # only: [:new, :create]
  #  resources :tweet
  #  resources :email
  end
end

