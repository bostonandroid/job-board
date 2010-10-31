Bandjob::Application.routes.draw do
  root :to => 'Jobs#index'
  resources :jobs
end
