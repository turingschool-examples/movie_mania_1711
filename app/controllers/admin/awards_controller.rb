class Admin::AwardsController < Admin::BaseController
  def index
    @awards = Award.all
    @award = Award.new
  end

  def create
    award = Award.new(award_params)
    if award.save
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
