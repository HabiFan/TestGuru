Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }, controllers: {
    sessions: 'users/sessions'
  }

  resources :tests, only: :index do
    resources :questions, shallow: true, only: :show do
      resources :answers, shallow: true, only: :show
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result  
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
    resources :badges

    root 'tests#index'
  end

  resources :gists, only: :create

  resources :feed_back, only: %i[index create]
  resources :badges, only: :index

end
