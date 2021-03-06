Rails.application.routes.draw do
  devise_for :users, :controllers => {
   registrations: 'users/registrations',
   omniauth_callbacks: 'users/omniauth_callbacks',
   sessions: 'users/sessions'
  }
  devise_scope :user do
    get 'users' => 'users/registrations#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:new, :create, :show, :destroy] do
    member do
      get 'sellshow'
    end
    resources :photos
    resources :deliveries
    resources :deals, only: [:new, :create]
  end
  resources :users, only: [:show, :update] do
    member do
      get 'logout'
      get 'profile'
      get 'identification'
      get 'sell'
    end
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :payments, only: [:new, :create, :edit]
  end
end
