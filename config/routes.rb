Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  #admins,usersはDevise関連。admin,userは通常のルーティング。
  root 'root#index'
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

  resources :admin, only: [:index]
  resources :attendances, only: [:create, :update]
  resources :user do
    #memberを使って自前のアクションを定義
    member do
      get :pass_change
      put :pass_update
      patch :pass_update
    end
  end

end
