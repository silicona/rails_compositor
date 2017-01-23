Rails.application.routes.draw do

	# Gets creados por rails g controller Perfil
  get 'perfil/index'

  get 'perfil/show'

  get 'perfil/update'

  root to: 'visitors#index'
  devise_for :users
  resources :users
  
  # Añade CRUD para el controlador Perfil:
  # GET '/perfil' => 'perfil#index' 
  # GET :id show, :as => 'perfil'
  # PUT y PATCH update :id
  resources :perfil, :only => [:index, :show, :update]

end
