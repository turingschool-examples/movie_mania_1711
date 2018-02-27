class AwardsController < ApplicationController
  def index
    @awards = Award.all
    @award = Award.new()
  end

  def create
    @award = Award.new(award_params)
    @award.save
    redirect_to awards_path
  end

  private
    def award_params
      params.require(:award).permit(:title)
    end
end
