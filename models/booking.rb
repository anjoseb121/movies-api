class Booking < Sequel::Model
  many_to_one :movie

  def to_api
    {
      id: id,
      date: date,
      movie: Movie.first(id: movie_id).to_api
    }
  end
end
