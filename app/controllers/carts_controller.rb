class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper


  def create
    movie = Movie.find(params[:movie_id])
    session[:cart] ||= Hash.new(0)
    session[:cart][movie.id.to_s] = session[:cart][movie.id.to_s] + 1
    # flash[:notice] = "You now have #{session[:cart][movie.id.to_s]} #{movie.title} in your cart."
    flash[:notice] = "You now have #{pluralize(session[:cart][movie.id.to_s], movie.title)} in your cart."
    redirect_to director_movies_path(params[:director_id])
  end

end
