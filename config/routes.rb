Rails.application.routes.draw do
  root 'pages#index'

  resources :lawsuits, only: [:index, :show]
end
