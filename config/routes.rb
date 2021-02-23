Rails.application.routes.draw do
  # Devise-gem-defined routes for users (sign-up etc.)
  devise_for :users

  # Routes for profile page etc.
  resources :users, only: [:show, :edit, :update] do
    # Nested routes for users (non-admins) to see their bookings
   resources :bookings, only: [:index, :show]
  end

  # Routes for shows, allowing views of all shows, details on a show, and creation of a show (for admins only)
  resources :shows, only: [:index, :show, :new, :create] do
    # Nested routes for bookings, i.e. /shows/:show_id/bookings...
    # TODO: decide if the index and show action here is just for admins???
    resources :bookings, only: [:index, :show, :new, :create]
  end

  # Root url is to the index of shows, regardless of user logged in or not
  root 'shows#index'
end
