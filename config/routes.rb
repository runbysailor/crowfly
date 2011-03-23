Crowfly::Application.routes.draw do
  match "about" => "application#about"
  match "contact" => "application#contact"
  match "terms" => "application#terms"
  devise_for :users, :controllers => { :confirmations => "users/confirmations", :invitations => "users/invitations", :passwords => "users/passwords", :sessions => 'users/sessions' }, :skip => [:registrations, :sessions] do
    get 'signin' => 'users/sessions#new', :as => :new_user_session
    post 'signin' => 'users/sessions#create', :as => :user_session
    get 'signout' => 'users/sessions#destroy', :as => :destroy_user_session
    get 'signup' => 'users/registrations#new', :as => :new_user_registration
    post 'users/account/create' => 'users/registrations#create', :as => :user_registration
    get 'users/account/edit' => 'users/registrations#edit', :as => :edit_user_registration
    put 'users/account/update' => 'users/registrations#update'
    delete 'users/account/remove' => 'users/registrations#destroy'
  end
  resources :users, :only => [:index, :show]
  match 'welcome' => "prospects#show", :as => "welcome"
  match 'convert/:id' => "prospects#convert", :as => "convert"
  resources :prospects
  scope ":company_name", :as => :user do  
    resources :geofiles
    resources :overlays, :except => [:show] do
      post :sort, on: :collection
    end
    resources :viewers do
      resources :beginnings, :only => [:edit, :update]
      resources :destinations, :except => [:show] do
        post :sort, on: :collection
      end
      resources :points, :except => [:show]
    end
    match "/:link" => "viewers#present"
    match "/" => "users#account", :as => "account"
  end  
  root :to => "prospects#new"
end