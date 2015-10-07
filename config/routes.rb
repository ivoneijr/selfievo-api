Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  namespace :api, defaults: { format: 'json', except: [:new, :edit] } do
    namespace :v1 do
      resources :users do
        collection do
          post :signin
          post :retrieve_password, :path => '/retrieve-password'
          get :me
          get :activation
        end
      end
    end
  end
  # Add a catch-all route
  match "*any" => lambda { |r| [ 404, {}, []] }, via: [:all]
end