Rails.application.routes.draw do
  resources :asignacion_formularios
  resources :config_formularios
  
  resources :tipo_formularios do
    member do
      post :replicate
      post :replicate_all
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
