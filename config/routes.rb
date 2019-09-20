Rails.application.routes.draw do
  devise_for :cloaks, controllers: {
    sessions: 'cloaks/sessions',
    registrations: 'cloaks/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  get '/withdraw_complete' => 'home#withdraw_complete',as: 'withdraw_complete'
  scope module: :public do
    get 'users/:id/image_select' => 'users#image_select',as: 'image_select'
    resources :users, only: %i(show edit update destroy) do
      resources :opinions, only: %i(new create)
      resource :withdraws, only: %i(show create)
    end
    resources :locations, only: %i(new show)
    get 'smoking_search' => 'locations#smoking_search',as: 'smoking_search'
    get 'location_info' => 'locations#location_info',as: 'location_info'
    resources :smoking_posts, except: %i(new)
    resources :cloaks, only: %i(show)
    get 'cloak_search' => 'cloaks#cloak_search',as: 'cloak_search'
    get 'cloak_calender' => 'cloaks#cloak_calender',as: 'cloak_calender'
    resources :cloak_locations, only: %i(index show)
    get 'cloak_location_info' => 'cloak_locations#cloak_location_info',as: 'cloak_location_info'
  end
  namespace :official do
    resources :cloaks
    resources :cloak_locations
    resources :closed_days, only: %i(index new create update destroy)
  end
end
