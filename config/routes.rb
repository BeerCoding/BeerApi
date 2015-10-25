Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    get "/beers" => "beers#index"
  end
end
