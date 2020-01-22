Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" }
  resources :users_admin, :controller => 'users'
  resources :supervisors

  resources :timesheets
  resources :schedules do
    collection do
      get :edit_multiple
      put :update_multiple
    end
  end
  resources :years, only: [:new,:create,:index]

  root 'application#index', as: :subdomain_root
  get 'admin', to: 'admins#index', as: :admin_root
  get 'supervisor', to: 'supervisors#index', as: :supervisor_root
  get 'student', to: 'timesheets#index', as: :student_root

  resources :admins do
    collection do
      get :edit_student, path: "edit_student/:id"
      post :add_student_timesheet, path: "add_student_timesheet/:id"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
