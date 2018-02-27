class AwardsController < ApplicationController

  def index
    @awards = Award.all
    @award = Award.new
  end

  def create
    @award = Award.new(award_params)
    if @award.save
    else
      flash.notice = "Name already exists!"
    end
    redirect_to awards_path
  end

  private

  def award_params
    params.require(:award).permit(:name)
  end

end
