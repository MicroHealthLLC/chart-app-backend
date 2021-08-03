Rails.application.routes.draw do
  resources :data_sets
  resources :reports
  resources :channels
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
