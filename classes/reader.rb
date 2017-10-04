class Reader < Index
  attr_accessor :name, :email, :city, :street, :house


  def initialize(name, email, city = '', street = '', house = '')
  	super()
  	@name, @email, @city, @street, @house = name, email, city, street, house
  end

  def to_s
  	"[#{@id}] #{@name}"
  end


end
