class Admin::AwardsController < Admin::BaseController

  def index
    @award = Award.new
  end

  def create
    @award = Award.new(award_params)
    if @award.save
      redirect_to(user_path(current_user))
    else
      render :index
    end
  end

  private

  def award_params
    params.require("award").permit(:title)
  end
end
