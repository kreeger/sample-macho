Macho::Application.routes.draw do
  resources :pushup_reminders
  
  resources :users do
    resources :pushup_reminders
  end

  root to: 'users#index'
end
