Rails.application.routes.draw do
  devise_for :admins, controllers: {omniauth_callbacks: "admins/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "admin#home"
end
