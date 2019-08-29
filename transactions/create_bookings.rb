require 'dry/transaction'

class CreateBooking
  include Dry::Transaction

  step :validate
  step :create

  private

  def validate(data)
    date = data[:date]
    movie_id = data[:movie_id]
    day_of_week = Date.parse(date).strftime('%u')

    is_able_day = Movie.where(Sequel[{ id: movie_id }] & Sequel.like(:days, "%#{day_of_week}%")).first
    available = Booking.where(date: date, movie_id: movie_id).count < 10

    if movie_id.empty? || date.empty?
      Failure(error: 'Missing field')
    elsif !available || !is_able_day
      Failure(error: 'Not available this date')
    else
      Success(movie_id: movie_id, date: date)
    end
  end

  def create(data)
    date = data[:date]
    movie_id = data[:movie_id]
    id = Booking.insert(date: date, movie_id: movie_id)
    Success(id: id)
  end
end
