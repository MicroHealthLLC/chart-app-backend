Rails.application.routes.draw do
  namespace :v1 do
    resources :data_sets
    resources :reports
    get "/public_reports_home", to: "reports_home#public"
    get "/personal_reports_home", to: "reports_home#personal"
    get "/group_reports_home", to: "reports_home#group"
    get "/public_reports", to: "reports#public"
    get "/personal_reports", to: "reports#personal"
    get "/group_reports", to: "reports#group"
    resources :channels
    resources :channels do
      resources :data_sets, only: :index
    end
    resources :tags
    resources :dashboards
    resources :news
    resources :users
    post "/login", to: "authentication#login"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
