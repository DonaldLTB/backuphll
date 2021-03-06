Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/pages/test' =>'pages#test'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except: [ :delete ] do
    resources :events, except: [ :index ]
    resources :topics, except: [ :index ]
  end

  get '/users/:id/edit_schedule' =>'users#edit_schedule', as: :edit_schedule
  patch '/users/:id/edit_schedule'=>'users#edit_schedule'

  resources :topics, only: [ :index ]
  resources :events, only: [ :index ]
end
