class YearsController < ApplicationController
  def index
    @years = Year.all
  end

  def new
    @year = Year.new
  end

  def create
    @year = Year.new(year_params)
    if @year.save
      flash[:success] = "Your year has been created."
      redirect_to years_path
    else
      flash[:danger] = "There was an issue creating your year."
      redirect_to new_year_path
    end
  end

private

def year_params
  params.require(:year).permit(:year)
end

end
