class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    if current_user.admin
      redirect_to admin_root_path
    elsif current_user.supervisor
      redirect_to supervisor_root_path
    else
      redirect_to student_root_path
    end
  end


end
