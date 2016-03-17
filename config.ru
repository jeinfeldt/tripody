require File.expand_path('../app.rb', __FILE__)

use Rack::ShowExceptions


require './app.rb'
run TripodyApp.new
