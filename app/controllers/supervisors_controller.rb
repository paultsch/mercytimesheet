class SupervisorsController < ApplicationController

  def index
    @supervisors = User.where(supervisor: true)
  end

  def show
    @supervisor = User.find_by(id: params[:id])
    #@students = User.find_by_sql "SELECT "
  end

  def new
    @supervisor = User.new
  end

  def create
    @supervisor = User.new(user_params)
    @supervisor.grade = 13
    @supervisor.admin = false
    @supervisor.supervisor = true
    @supervisor.student = false
    if @supervisor.save
      flash[:success] = "Supervisor successfully created."
      redirect_to supervisor_path(@supervisor)
    else
      flash[:danger] = "There was an issue creating this supervisor."
      redirect_to new_supervisor_path
    end
  end

  def edit
    @supervisor = User.find(params[:id])
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @supervisor = User.find(params[:id])
    if @supervisor.update(user_params)
      flash[:success] = "Supervisor was successfully updated"
      redirect_to supervisor_path(@supervisor)
    else
      flash[:danger] = "There was an issue updating supervisor information"
      redirect_to edit_supervisor_path(@supervisor)
    end
  end

private

def user_params
  params.require(:user).permit(:email, :admin, :supervisor, :student, :first_name, :last_name, :grade, :password)
end

end
