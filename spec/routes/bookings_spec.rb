require 'spec_helper'
RSpec.describe MoviesApi do
  describe '#GET bookings' do
    context 'get all' do
      before do
        id = Movie.insert(name: 'name',
                          description: 'description',
                          days: '[1]',
                          cover_url: 'http://movies-api.com/tmp/file.png')
        @booking_id = Booking.insert(date: Date.today, movie_id: id)
      end

      it 'returns all bookings' do
        get '/bookings', params: { start_date: Date.today, end_date: Date.today }
        expect(JSON.parse(last_response.body)[0]['id']).to eq(@booking_id)
        expect(last_response.status).to eq 200
      end
    end
    context 'without bookings' do
      it 'returns no bookings' do
        get '/bookings'
        expect(JSON.parse(last_response.body).length).to eq(0)
        expect(last_response.status).to eq 200
      end
    end
  end

  describe '#POST bookings' do
  end
end
