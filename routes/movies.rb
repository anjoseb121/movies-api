class MoviesApi < Sinatra::Application
  get '/movies' do
    day = params[:day]
    json Movie.where(Sequel.like(:days, "%#{day}%")).map(&:to_api)
  end

  post '/movies' do
    name = params[:name]
    description = params[:description]
    days = params[:days]
    filename = params[:cover][:filename]
    file = params[:cover][:tempfile]
    File.open("/tmp/#{filename}", 'wb') do |f|
      f.write(file.read)
    end

    json Movie.insert(name: name,
                      description: description,
                      days: days,
                      cover_url: "http://#{request.host_with_port}/tmp/" + filename)
  end
end
