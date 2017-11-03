Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "messages#index"

  resource :messages, only: [:new, :show] do
    resources :text
    resources :tweet
    resources :email
  end
end

