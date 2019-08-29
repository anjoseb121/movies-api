class MoviesApi < Sinatra::Application
  get '/bookings' do
    start_date = params[:start_date]
    end_date = params[:end_date]
    json Booking.where(date: start_date..end_date).map(&:to_api)
  end

  post '/bookings' do
    result = CreateBooking.new.call(params)
    if result.success?
      json result.value_or(0)
    else
      json result.failure
    end
  end
end
