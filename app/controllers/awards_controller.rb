class AwardsController < ApplicationController
  before_action :set_award, only: [:show]

  def show
  end

  def index
    @awards = Award.all
  end

  private

    def set_award
      @award = Award.find(params[:id])
    end

end
