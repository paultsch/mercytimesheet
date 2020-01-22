class UsersController < ApplicationController

  def show
    @student = User.find(params[:id])
  end

  def edit
    @student = User.find(params[:id])
    @supervisors = User.where(supervisor: true)
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @student = User.find(params[:id])
    if @student.update(user_params)
      flash[:success] = "Student was successfully updated"
      redirect_to admin_path(@student)
    else
      flash[:danger] = "There was an issue updating student information"
      redirect_to edit_users_admin_path(@student)
    end
  end

  def new
    @user = User.new
    @supervisors = User.where(supervisor: true)
  end

  def create
    @user = User.new(user_params)
    @user.admin = false
    @user.supervisor = false
    @user.student = true
    if @user.save
      flash[:success] = "Student successfully created."
      redirect_to admin_path(@user)
    else
      flash[:danger] = "There was an issue creating this student."
      redirect_to new_users_admin_path
    end
  end

private

def user_params
  params.require(:user).permit(:email, :admin, :supervisor, :student, :first_name, :last_name, :grade, :password, :password_confirmation)
end

end
