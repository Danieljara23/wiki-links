Rails.application.routes.draw do
  resources :links, :has_many => :comments

  root 'links#index'

  devise_for :users,controllers:{ omniauth_callbacks: "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
