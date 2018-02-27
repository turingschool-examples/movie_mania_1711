class AwardsController < ApplicationController

  def index
    @awards = Award.all
  end

  def show
    @award = Award.find(params[:id])
  end

  def create
    @award = Award.new(award_params)
    @award.user = current_user
    if @award.save
      redirect_to admin_awards_path
    else
      render :index
    end
  end

  private

    def award_params
      params.require(:award).permit(:title)
    end

end
