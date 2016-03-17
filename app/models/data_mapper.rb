require 'redis'
require_relative 'poi'
# maps data from data provider to our POI Model
class Data_Mapper

  # constructor
  def initialize
  end

  # maps result list from yelp to list of poi models
  def map_list (response, token)
    result = Array.new
    s_helper = Storage_Helper.new
    # initializing pois
    response['businesses'].each do |item|
      mark = s_helper.is_stored?(token, item['id']) ? '-' : '+'
      result << map_poi(item, mark)
    end
    result
  end

  # maps single poi from yelp to poi model
  def map_poi (response, mark)
    Poi.new(response['id'], response['name'], response['snippet_text'], response['image_url'], mark)
  end

end
