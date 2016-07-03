Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	resources :events
  	resources :charts, only: [:index, :show]
    get "/event_correlations/:event_name", to: "event_correlations#show"
  end
end
