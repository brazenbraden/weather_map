Rails.application.routes.draw do

  get 'search', to: 'application#search', as: :search
  get 'load', to: 'application#load', as: :load

  root 'application#index'
end
