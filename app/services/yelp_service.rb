require 'rubygems'
require 'sinatra'
require 'json'
require 'oauth'
# authentication information taken from credentials file
require_relative '../../credentials.rb'

class Yelp_Service

  # constructor
  def initialize(limit)
    # initialize consumer variable
    consumer = OAuth::Consumer.new(CONSUMER_KEY, SECRET, {
        :site => "http://api.yelp.com",
        :signature_method => "HMAC-SHA1",
        :scheme => :query_string})
    # create access token
    @access_token = OAuth::AccessToken.new(consumer, TOKEN, TOKEN_SECRET)
    @limit = limit
   end

  # executes search api call to yelp with given cityname
  def get_api_data(cityname)
	  # parse special characters
	  encoded_cityname = URI.encode(cityname);
    # make yelp api call
    search_url = "/v2/search?location=#{encoded_cityname}"\
    "&cc=EN&lang=en&limit=#{@limit}&category_filter=landmarks"
    json_response = @access_token.get(search_url)
    # parse response to json
    response = JSON.parse(json_response.body)
  end

  # fetches detailed information from yelp for given poi
  def get_detail_information(poi_id)
	  # parse special characters
	  encoded_poi_id = URI.encode(poi_id);
    # make yelp api call
    poi_url = "/v2/business/#{encoded_poi_id}"\
    '?cc=EN&lang=en&lang_filter=true'
    json_response = @access_token.get(poi_url)
    # parse response to json
    response = JSON.parse(json_response.body)
  end

end
