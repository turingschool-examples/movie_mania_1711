class AwardsController < ApplicationController

  def index
    @awards = Award.all
    @award = Award.new
  end

  def show
    @award = Award.find(params[:id])
  end

  def new
    @award = @movie.awards.new
  end


  def create
    award = Award.create!(award_params)
    redirect_to award_path(award)
  end

  private

    def award_params
      params.require(:award).permit(:title)
    end
end
