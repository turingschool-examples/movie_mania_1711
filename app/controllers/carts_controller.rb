class CartsController < ApplicationController

  def create
    movie = Movie.find(params[:movie_id])
    flash[:notice] = "You now have 1 #{movie.title} in your cart."
    redirect_to director_movies_path(params[:director_id])
  end

end
