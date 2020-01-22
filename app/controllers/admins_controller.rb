class AdminsController < ApplicationController
  before_action :require_admin

  def index
    @students = User.where(student: true)
  end

  def show
    @student = User.find_by(id: params[:id])
    @timesheet = Timesheet.find_by_sql "SELECT t.user_id, t.signed_in, s.date, s.before_after_school FROM schedules s LEFT JOIN timesheets t ON s.date = t.signed_in AND t.user_id = #{params[:id]} AND t.year_id = 1 WHERE before_after_school = 't'"
  end

  def edit_student
    @student = User.find_by(id: params[:id])
    @timesheet = Timesheet.new
  end

  def add_student_timesheet
    @timesheet = Timesheet.new(timesheet_params)
    @timesheet.user_id = params[:id]
    @timesheet.year_id = 1
    if @timesheet.save
      flash[:success] = "Record has been created"
      redirect_to admin_path(params[:id])
    else
      flash[:danger] = "There was an issue saving the record"
      redirect_to edit_student_admins_path
    end
  end


private

def require_admin
  if user_signed_in? and !current_user.admin?
    flash[:danger] = "Only admin users have access to this page"
    redirect_to subdomain_root_path
  end
end

def timesheet_params
  params.require(:timesheet).permit(:signed_in, :user_id, :year_id)
end

end
