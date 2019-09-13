Rails.application.routes.draw do
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
    get 'after_search_set_marker' => 'locations#after_search_set_marker',as: 'after_search_set_marker'
    get '/locations/get_destination/:id' => 'locations#get_destination',as: 'get_destination'
    resources :smoking_posts, except: %i(new)
  end
end
