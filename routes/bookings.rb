class MoviesApi < Sinatra::Application
  get '/bookings' do
    start_date = params[:start_date]
    end_date = params[:end_date]
    json Booking.where(date: start_date..end_date).map(&:to_api)
  end

  post '/bookings' do
    date = params[:date]
    movie_id = params[:movie_id]
    day_of_week = Date.parse(date).strftime('%u')
    is_able_day = Movie.where(Sequel[{ id: movie_id }] & Sequel.like(:days, "%#{day_of_week}%")).first
    available = Booking.where(date: date, movie_id: movie_id).count < 10
    if available && is_able_day
      Booking.insert(date: date, movie_id: movie_id)
      json response: 'created'
    else
      json error: 'unavailable day'
    end
  end
end
