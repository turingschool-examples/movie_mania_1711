class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def create
    movie = Movie.find(params[:movie_id])

    @cart.add_movie(params[:movie_id])
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(session[:cart][movie.id.to_s], movie.title)} in your cart."
    redirect_to director_movies_path(params[:director_id])
  end

end
