class AwardsController < ApplicationController

  def index
    @awards = Award.all
  end

  def new
    @award = Award.new 
  end

  def create
    @award = Award.new(award_params)
    if @award.save
      redirect_to awards_path
    else
      render :new
    end
  end

  def show
    @award = Award.find(params[:id])
  end

  private

    def award_params
      params.require(:award).permit(:title)
    end

end