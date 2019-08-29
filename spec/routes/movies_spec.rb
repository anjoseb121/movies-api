require 'spec_helper'
RSpec.describe MoviesApi do
  describe '#GET movies' do
    context 'get  allt' do
      before do
        Movie.insert(name: 'name',
                     description: 'description',
                     days: '[1]',
                     cover_url: 'http://movies-api.com/tmp/file.png')
      end

      it 'returns all movies' do
        get '/movies'
        expect(JSON.parse(last_response.body).length).to eq(1)
        expect(last_response.status).to eq 200
      end
    end
    context 'without movies' do
      it 'returns no movies' do
        get '/movies'
        expect(JSON.parse(last_response.body).length).to eq(0)
        expect(last_response.status).to eq 200
      end
    end
  end

  describe '#POST movies' do
  end
end
