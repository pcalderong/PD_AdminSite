Rails.application.routes.draw do

  # get 'sessions/create'
  #
  # get 'sessions/destroy'
  #
  get 'home/show'

 #  get "/login", to: redirect('/auth/google_oauth2')
 #  # [START logout]
 # get "/logout", to: "sessions#destroy"
 # # [END logout]
   get 'auth/:provider/callback', to: 'sessions#create'
   get 'auth/failure', to: redirect('/')
   get 'signout', to: 'sessions#destroy', as: 'signout'

   resources :sessions, only: [:create, :destroy]
   resource :home, only: [:show]

  #  root to: "home#show"
# resources :usuarios


 get "reports/generate_report" => "reports#generate_report"
 get "/personas/export" => "personas#export"
 get "/personas/import" => "personas#import"
 post "/personas/import" => "personas#importar"
 get "/reports/template" => "reports#template"
 get "/personas/update_cantones", as: "update_cantones"
 get "/personas/update_distritos", as: "update_distritos"
 get "/personas/update_tipos_padecimientos", as: "update_tipos_padecimientos"
 get "/reports/update_cantones_report", as: "update_cantones_report"
 get "/reports/update_distritos_report", as: "update_distritos_report"
 get "/reports/update_tipos_padecimientos_report", as: "update_tipos_padecimientos_report"
  # [START sessions]
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  # resource :session, only: [:create, :destroy]

  resources :reports
  resources :lookups
  resources :personas do
    resources :info_contactos
    resources :info_extra_pacientes
    resources :diagnosticos
    resources :historial_clinicos
    resources :direccions
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'personas#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
