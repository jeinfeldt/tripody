# general configuration for application
class ApplicationController < Sinatra::Base
  # some settings that are valid for all controllers
  set :views, File.expand_path('../../views', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)
  enable :sessions

  configure :production, :development do
    enable :logging
  end
end
