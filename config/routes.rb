Rails.application.routes.draw do
  resources :events
  root 'user/homes#top'


  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :user do
    get "/top"=> "homes#top"
    root to: 'homes#top'
    get "homes/about"=> "homes#about"
    resources :users, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    #退会ページのルート
      get "users/:id/check" => "users#check"
	    patch "users/:id/check" => "users#withdrow"
    #ここまで
    resources :items, only: [:index, :show]
    resources :blogs, only: [:index, :show]
    resources :events, only: [:index, :show]
    resources :inquities, only: [:new, :create]
  end


  namespace :admin do
    get "/top"=> "homes#top"
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :admins, only: [:show]
    resources :blogs, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :items, only: [:new, :create, :index, :show, :edit, :update, :destroy]
    resources :events, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  end

end
