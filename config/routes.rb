ContactsAPI::Application.routes.draw do
  resources :users, except: [:edit, :new]
  resources :contacts, except: [:edit, :new, :index]
  resources :contact_shares, only: [:create, :destroy]

  resources :users do
    resources :contacts, only: :index
  end
end
