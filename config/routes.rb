ToDo::Application.routes.draw do
  resources :tasks, :except => [:index]
  resources :lists
  root :to => 'lists#index'
end
