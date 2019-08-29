class MoviesApi < Sinatra::Application
  get '/movies' do
    day = params[:day]
    json Movie.where(Sequel.like(:days, "%#{day}%")).map(&:to_api)
  end

  post '/movies' do
    result = CreateMovie.new.call(params)
    if result.success?
      json result.value_or(0)
    else
      json result.failure
    end
  end
end
