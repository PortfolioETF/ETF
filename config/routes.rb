Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#top'
  scope module: :public do
    resources :users, only: %i(show edit update destroy)
    get 'users/:id/image_select' => 'users#image_select',as: 'image_select'
  end
end
