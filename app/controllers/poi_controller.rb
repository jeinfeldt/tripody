# encapsulates all actions regarding POIs
class PoiController < ApplicationController
  # controller variables
  yelp_service = Yelp_Service.new(10)
  data_mapper = Data_Mapper.new

  # method to get detail information about a selected poi
  get'/detail/:element_id' do
	  element_id = params[:element_id]
    response= yelp_service.get_detail_information(element_id)
    @poi = data_mapper.map_poi(response, '-')
    erb :detail
  end

end
