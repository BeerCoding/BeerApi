Rails.application.routes.draw do
  namespace :api do
    get "/beers" => "beers#index"
  end
end
