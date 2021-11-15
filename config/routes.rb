Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reservations, only: [:index, :create, :destroy, :update]
      resources :destinations, only: [:index, :show, :create, :destroy ]
      devise_for :users, controllers: { 
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
       }
    end
  end
end
