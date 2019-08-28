require 'sinatra'
require 'sequel'
require 'sinatra/contrib'

DB = Sequel.connect(ENV['DATABASE_URL'])
#DB = Sequel.postgres('test', user: 'antonio', password: 'admin', host: 'localhost')

%w[models routes].each { |dir| Dir.glob("./#{dir}/*.rb", &method(:require)) }

class MoviesApi < Sinatra::Application
  run! if app_file == $PROGRAM_NAME
end
