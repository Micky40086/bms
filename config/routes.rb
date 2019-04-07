Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/login", to: "page#login"
  post "/login", to: "page#is_login"
  root "admin#home"
end
