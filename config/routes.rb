Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
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
    get 'users/my_posts' => 'users#my_posts',as: 'my_posts'
    resources :users, only: %i(show edit update) do
      resources :opinions, only: %i(new create)
      resource :withdraws, only: %i(show create)
    end
    resources :reviews, only: %i(create destroy index new)
    get 'reviews_cloak' => 'reviews#reviews_cloak',as: 'reviews_cloak'
    resources :locations, only: %i(new show)
    get 'smoking_search' => 'locations#smoking_search',as: 'smoking_search'
    get 'location_info' => 'locations#location_info',as: 'location_info'
    resources :smoking_posts, except: %i(new)
    resources :cloaks, only: %i(show)
    get 'cloak_search' => 'cloaks#cloak_search',as: 'cloak_search'
    get 'cloak_calendar' => 'cloaks#cloak_calendar',as: 'cloak_calendar'
    resources :cloak_locations, only: %i(index)
    get 'cloak_location_info' => 'cloak_locations#cloak_location_info',as: 'cloak_location_info'
    resources :reserves, only: %i(index new create destroy)
    resources :closed_days, only: %i(index)
    resources :emergency_closed_days, only: %i(index)
  end

  namespace :official do
    resources :cloaks, only: %i(show edit update destroy)
    resources :reviews, only: %i(index)
    get 'cloak_calendar' => 'cloaks#cloak_calendar',as: 'cloak_calendar'
    resources :cloak_locations, except: %i(show)
    resources :closed_days, only: %i(index new create destroy)
    resources :emergency_closed_days, only: %i(index new create destroy)
    resources :reserves, only: %i(index destroy)
    resources :delete_closed_days_and_emergency_closed_days, only: %i(index destroy)
  end
end
