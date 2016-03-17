# encapsulates all actions regarding lists
class ListController < ApplicationController
  # controller variables
  redis = Redis.new(:host => 'localhost', :port => 6379, :password => nil)
  yelp_service = Yelp_Service.new(10)

  # get on empty list for convenience
  get '/list/' do
    @token = ""
    @result_array = Array.new
    erb :mylist
  end

  # generating token for list
  get '/token/' do
    token = generate_token
    token
  end

  # fetches a list with a specified token
  get '/list/:token' do
    @token = params[:token]
    @result_array = Array.new
    data_mapper = Data_Mapper.new
    # init pois for rendering view
    redis.lrange(@token, 0, -1).each do |id|
      response = yelp_service.get_detail_information(id)
      @result_array << data_mapper.map_poi(response, '-')
    end
    erb :mylist
  end

  # adding specified poi to a users list
  post '/list/:token/:id' do
    token = params[:token]
    id = params[:id]
    s_helper = Storage_Helper.new
    # only push if it does not exists yet
    unless s_helper.is_stored?(token, id)
      redis.rpush(token, id)
    end
  end

  # removing specified poi from list
  delete '/list/:token/:id' do
    token = params[:token]
    id = params[:id]
    redis.lrem(token, -1, id)
  end

  # helper method to generate a hashed value
  def generate_token
      SecureRandom.urlsafe_base64(nil, false)
  end

  private :generate_token

end
