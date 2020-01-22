class User::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  
  protected
  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit( :email, :password, :password_confirmation, :admin, :supervisor, :student, :first_name, :last_name, :grade ) }
     devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :admin, :supervisor, :student, :first_name, :last_name, :grade] )
  end
end
