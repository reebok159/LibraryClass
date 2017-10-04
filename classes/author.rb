
class Author < Index
  attr_accessor :name, :biography

  def initialize(name, biography = "")
  	  super()
  	  @name = name
  	  @biography = biography
  end

end
