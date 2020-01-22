class TimesheetsController < ApplicationController
  def index
    @timesheets = Timesheet.find_by_sql "SELECT t.user_id, t.signed_in, s.date, s.before_after_school FROM schedules s LEFT JOIN timesheets t ON s.date = t.signed_in AND t.user_id = #{current_user.id} AND t.year_id = 1 WHERE before_after_school = 't'"
  end

  def new
    @timesheet = Timesheet.new
  end

  def create
    @timesheet = Timesheet.new(timesheet_params)
    @timesheet.user = current_user
    @timesheet.year_id = 1
    if @timesheet.save
      flash[:success] = "Your timesheet has been saved."
      redirect_to subdomain_root_path
    else
      render 'new'
    end
  end

private

  def timesheet_params
    params.require(:timesheet).permit(:signed_in, :user_id, :year_id)
  end

end
