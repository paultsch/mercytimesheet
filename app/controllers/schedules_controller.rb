class SchedulesController < ApplicationController


  def index
    @schedules = Schedule.all

    # Timesheet.find_by_sql "SELECT t.user_id, t.signed_in, s.date, s.before_after_school FROM timesheets t INNER JOIN schedules s ON t.signed_in = s.date"


  end

  def edit_multiple
    @schedules = Schedule.where(year_id: 1)
  end

  def update_multiple
    Schedule.update(params[:dates].keys, params[:dates].values)
    redirect_to edit_multiple_schedules_path
  end

private

def schedule_params
  params.require(:schedule).permit(:before_after_school, :during_school)
end


end
