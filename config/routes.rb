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
  resources :attendances, only: [:index, :create, :update] do
    collection do
      get :application_new
      post :application_create
    end
    member do
      post :approval
    end
  end


  resources :user do
    #memberを使って自前のアクションを定義
    member do
      get :pass_change
      put :pass_update
      patch :pass_update
    end
  end

end
