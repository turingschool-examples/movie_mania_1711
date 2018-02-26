class Cart

  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents ||= Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_movie(movie_id)
    @contents[movie_id] += 1
  end

  def count_of(movie_id)
    @contents[movie_id].to_i
  end

end
