Rails.application.routes.draw do
  root to: 'tasks#index'
  post 'tasks/:id/completed', to: 'tasks#completed', as: :completed
  resources :tasks, except: :show
end
