# encapsulates all actions regarding search
class SearchController < ApplicationController

  # call index.erb template file
  get '/' do
    logger.info "opening start page"
    erb :index
  end

  # call yelp api with entered city name
  get '/search/:searchInput/?:token?' do
    # get url parameters
    @searchInput = params[:searchInput]
    token = params[:token]
    unless token.nil?
      token = token.eql?('null') ? nil : token
    end
    # make yelp api call with entered city name
    yelp_service = Yelp_Service.new(10)
    response = yelp_service.get_api_data(@searchInput)
    # map data and render view
    data_mapper = Data_Mapper.new
    @result_array = data_mapper.map_list(response, token)
    erb :result
  end

end
