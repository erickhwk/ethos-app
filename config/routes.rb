Rails.application.routes.draw do
  root 'pages#index'

  get 'lawsuits' => 'pages#lawsuits'
end
