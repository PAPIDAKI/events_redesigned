Events::Application.routes.draw do
  get "signup"=>"users#new"
  resource :session


  root "events#index"
  # get "events"     => "events#index"
  # get "events/:id" => "events#show", as: "event"
  # get "events/:id/edit" => "events#edit", as: "edit_event"
  # patch "events/:id" => "events#update"
  resources :events do
    resources :registrations
  end
  resources :users


end
