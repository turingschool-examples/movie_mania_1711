class AddYearToAwardMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :award_movies, :year, :bigint
  end
end
