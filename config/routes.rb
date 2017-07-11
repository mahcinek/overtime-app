Rails.application.routes.draw do
  resources :audit_logs, except: [:new, :edit, :destroy]
  resources :posts
  devise_for :users , skip: [:registrations]
  root to: 'static#home'
end
