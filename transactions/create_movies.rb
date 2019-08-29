require 'dry/transaction'

class CreateMovie
  include Dry::Transaction

  step :validate
  step :create

  private

  def validate(data)
    if data[:name].empty? || data[:description].empty? || data[:days].empty? || data[:cover].nil?
      Failure(error: 'Missing field')
    else
      Success(name: data[:name], description: data[:description],
              days: data[:days], cover: data[:cover][:tempfile],
              cover_name: data[:cover][:filename])
    end
  end

  def create(data)
    cover_name = data[:cover_name]
    cover = data[:cover]
    name = data[:name]
    description = data[:description]
    days = data[:days]

    File.open("/tmp/#{cover_name}", 'wb') do |f|
      f.write(cover.read)
    end

    id = Movie.insert(name: name,
                      description: description,
                      days: days,
                      cover_url: 'http://movies-api-rb.herokuapp.com/tmp/' + cover_name)
    Success(id: id)
  end
end
