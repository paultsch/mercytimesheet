Rails.application.routes.draw do
  devise_for :users
  root to: 'timesheets#index'
  resources :timesheets
  resources :schedules do
    collection do
      get :edit_multiple
      put :update_multiple
    end
  end
  resources :years, only: [:new,:create,:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
