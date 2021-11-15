Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, default: { format: :json } do
    namespace :v1 do
      resources :destinations, only: [:index, :show, :create, :destroy ]
    end
  end

  root to: "reservations#index"


  # GET /reservations (gets all reservations)
  # POST /reservations (the id's are hardcoded but the postman post method works if you send dates as json data
  #{ "startingDay": "smth", "endingDay": "smth" }
  # DELETE /reservation/:id
  

  resources :reservations, only: [:index, :create, :destroy], defaults: {format: :json}

end
