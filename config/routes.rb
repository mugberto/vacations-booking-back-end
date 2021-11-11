Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post :reg, to: "registrations#create" 
      post :auth, to: "authentications#create"
    end
  end
end
