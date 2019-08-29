require 'sinatra'
require 'sequel'
require 'sinatra/contrib'

DB = if Sinatra::Base.production?
       Sequel.connect(ENV['DATABASE_URL'])
     else
       Sequel.postgres('test', user: 'antonio', password: 'admin', host: 'localhost')
     end

%w[models transactions routes].each { |dir| Dir.glob("./#{dir}/*.rb", &method(:require)) }

class MoviesApi < Sinatra::Application
  run! if app_file == $PROGRAM_NAME
end
