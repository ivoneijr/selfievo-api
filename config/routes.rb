Rails.application.routes.draw do
  
  namespace :api, defaults: { format: 'json', except: [:new, :edit] } do
    namespace :v1 do
      resources :users do
        collection do
          post :signin
          post :retrieve_password, :path => '/retrieve-password'
          get :me
          get :exists, :path => '/exists/:name'
        end
        member do
          get :activate
        end
      end
    end
  end
  # Add a catch-all route
  match "*any" => lambda { |r| [ 404, {}, []] }, via: [:all]
end
