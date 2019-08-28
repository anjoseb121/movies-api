require 'sinatra'
require 'sequel'
require 'sinatra/contrib'
require "sinatra/namespace"

#DB = Sequel.connect(adapter: :postgres, database: 'my_db', host: 'localhost', user: 'db_user')
DB = Sequel.sqlite('db/development.sqlite3')

%w{models routes}.each {|dir| Dir.glob("./#{dir}/*.rb", &method(:require))}

class MoviesApi < Sinatra::Application
  run! if app_file == $0
end
