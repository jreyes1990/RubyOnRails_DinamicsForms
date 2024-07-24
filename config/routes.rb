Rails.application.routes.draw do
  resources :formularios
  resources :asignacion_formularios

  resources :tipo_formularios do
    member do
      get 'step', to: 'config_formularios#step'
      post 'step', to: 'config_formularios#update_step'
      get 'finish', to: 'config_formularios#finish'
      post :replicate
      post :replicate_all
    end
  end

  resources :config_formularios do
    member do
      get 'step', to: 'config_formularios#step'
      post 'step', to: 'config_formularios#update_step'
      get 'finish', to: 'config_formularios#finish'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
