Rails.application.routes.draw do
  mount ApiRoot => ApiRoot::PREFIX

  namespace :admins do
    resources :blog_articles, except: [:show]
    resources :blog_tags, except: [:show]
  end
  devise_for :admins, controllers: {omniauth_callbacks: "admins/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "admin#home"
end
