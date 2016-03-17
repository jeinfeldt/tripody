require 'redis'
# maps data from data provider to our POI Model
class Storage_Helper

  # constructor
  def initialize
    @redis  = Redis.new(:host => 'localhost', :port => 6379, :password => nil)
  end

  # evaluates whether given id is already in storage
  def is_stored? (token, id)
    # guard clause for nil token, we just assume there is no entry
    if(token.nil?)
      return false
    end
    # check redis for id
    id_list = @redis.lrange(token, 0, -1)
    id_list.include?(id)
  end

end
