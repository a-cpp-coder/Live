Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check
  # Defines the root path route ("/"), eg:  # root "posts#index"
  root "articles#index"

  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"

  # Whenever we have such a combination of routes, controller actions, and views that work together to perform CRUD operations on an entity, we call that entity a resource.
  resources :articles do # it's a ruby dsl(domain specific language), also in rails db, :articles is a symbol
    resources :comments
  end


end
