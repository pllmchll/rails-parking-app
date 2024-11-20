Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :parking_spots, only: [:index, :create, :destroy] do
    collection do
      post 'park'
      get 'find_license'
      get 'find_color'
    end
    member do
      delete 'leave'
    end
  end
  root "parking_spots#index"
end
