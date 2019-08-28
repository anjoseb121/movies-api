require 'sinatra'
require 'sequel'
require 'sinatra/contrib'
require 'sinatra/namespace'

# DB = Sequel.connect(adapter: :postgres, database: 'my_db', host: 'localhost', user: 'db_user')
DB = Sequel.postgres('test', user: 'antonio', password: 'admin', host: 'localhost')

%w[models routes].each { |dir| Dir.glob("./#{dir}/*.rb", &method(:require)) }

class MoviesApi < Sinatra::Application
  run! if app_file == $PROGRAM_NAME
end
