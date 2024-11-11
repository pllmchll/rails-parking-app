Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parking_spots, only: [:index, :create, :destroy] do
    post 'park', on: :collection
  end
  root "parking_spots#index"
end
