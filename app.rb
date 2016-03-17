require 'yaml'
require 'bundler'
Bundler.require
require 'logger'
require_all 'app'

# Some Run-Time configuration...
ApplicationController.configure do
    set :environment, 'development'
	set :root, File.dirname(__FILE__)

  # DB Connections, Logging and Stuff like that
end

# here I glue everything together
class TripodyApp < Sinatra::Base
  use SearchController
  use ListController
  use PoiController
 end
