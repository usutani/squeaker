Squeaker::Application.routes.draw do
  resources :users do
    resources :messages
  end
  resource :search, :only => :show, :controller => :search
end
