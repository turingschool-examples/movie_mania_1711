class Admin::AwardsController < Admin::BaseController

  def new
    @award = Award.new
  end

  def create
    @award = current_user.awards.new(award_params)
    if @award.save
      flash[:success] = "You have created a new award"
      redirect_to awards_path
    else
      render :new
    end
  end

  private

    def award_params
      params.require(:award).permit(:title)
    end

    def set_award
      @award = Award.find(params[:id])
    end
end
