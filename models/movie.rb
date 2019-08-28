class Movie < Sequel::Model
  one_to_many :bookings

  def to_api
    {
      id: id,
      name: name,
      description: description,
      cover_url: cover_url,
      days: days
    }
  end
end
