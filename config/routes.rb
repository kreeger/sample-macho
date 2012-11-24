Macho::Application.routes.draw do
  resources :welcomes


  resources :users do
    resources :pushup_reminders
  end

  root to: 'home#index'
end
