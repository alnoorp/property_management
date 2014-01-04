PropertyManagement::Application.routes.draw do
  resources :buildings, :owners
  root 'buildings#index'
end
