Rails.application.routes.draw do
  # Devise-gem-defined routes for users (sign-up etc.)
  devise_for :users

  # Routes for profile page etc.
  resources :users, only: [:show, :edit, :update]

  # Routes for shows, allowing views of all shows, details on a show, and creation of a show (for admins only)
  resources :shows, only: [:index, :show, :new, :create] do
    # Nested routes for bookings, i.e. /shows/:show_id/bookings...
    # TODO: decide if the index and show action here is just for admins???
    resources :showings, only: [:index, :show, :new, :create]
    resources :reviews, only: [:create, :show]
  end
  resources :showings, only: [] do
    resources :bookings, only: [:new, :create, :show]
  end

  # ADMIN only route to view all bookings
  resources :bookings, only: [:index, :edit, :update, :destroy]

  # ADMIN only routes to view all and delete individual reviews
  resources :reviews, only: [:index, :destroy]

  # Root url is to the index of shows, regardless of user logged in or not
  root 'shows#index'
end
