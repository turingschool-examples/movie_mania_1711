class Admin::AwardsController < Admin::BaseController

  def index
    @award = Award.new
  end
end
