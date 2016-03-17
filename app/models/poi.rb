# encapsulates information fetched from yelp in an usable object
class Poi
  # contructor method
  # params:
  # id - id from yelp
  # name - name of poi
  # description - short description of poi
  # imageurl - url for imagerequest
  # marked - mark whether poi is already in personal list
  def initialize(id, name, description, imageurl, marked)
    @id = id
    @name = name
    @description = description
    @imageurl = imageurl
    @marked = marked
  end

  def p_id
    @id
  end

  def p_name
    @name
  end

  def p_description
    @description
  end

  def p_imageurl
    @imageurl
  end

  def p_marked
    @marked
  end

end
