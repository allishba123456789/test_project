Rails.application.routes.draw do

  resources :transactions, only: [:new, :index]
  get '/users/forall', to: 'users#forall'

  devise_for :users, :controllers => { registrations: 'registrations' }

  shallow do
    resources :users do
      resources :subscriptions, only: [:index, :show] do
       resources :usages, only: [:new, :create]
     end
   end
 end

 resources :usages, only: :index

 resources :plans, only: [:index, :new, :create, :show] do
   resources :features, only: [:new, :create ]
   resources :subscriptions, only: [:new]
 end

 root "plans#index"
end

