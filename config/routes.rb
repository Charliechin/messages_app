Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/messages', to: 'messages#new'
  get '/',         to: 'messages#new'


  resource :messages, only: [:new, :create] do
    resources :texts # only: [:new, :create]
    resources :tweets
    resources :emails
  end
end

