Rails.application.routes.draw do
  namespace :v1 do
    resources :data_sets
    resources :reports
    resources :channels
    resources :tags
    resources :dashboards
    resources :news
    post "/login", to: "authentication#login"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
