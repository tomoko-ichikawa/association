Rails.application.routes.draw do
    root 'blogs#index'
    devise_for :users
    resources :blogs
    resources :users
end
