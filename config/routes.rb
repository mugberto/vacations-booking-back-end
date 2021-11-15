Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # post :reg, to: "registrations#create" 
      # post :auth, to: "sessions#create"
      # resources :sessions, only: [:index, :create, :destroy], defaults: {format: :json}
      resources :reservations, only: [:index, :create, :destroy, :update]
      devise_for :users, controllers: { 
        registrations: 'api/v1/users/registrations',
        sessions: 'api/v1/users/sessions'
       }
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: "reservations#index"
  # GET /reservations (gets all reservations)
  # POST /reservations (the id's are hardcoded but the postman post method works if you send dates as json data
  #{ "startingDay": "smth", "endingDay": "smth" }
  # DELETE /reservation/:id 

end
